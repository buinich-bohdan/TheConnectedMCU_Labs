/**
 * @file user.c
 * @brief File containing user functions
 **/

/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>
#include "ADC.h"

#define L_N(i, n) ((i) << (n))

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/*!
initialization Timer 2 and OC5
*/

void InitTimer2AndOC5(void) {
    // Initialize Timer2. See details in Section 14 (Timers) 
    // of the PIC32 Family Reference Manual
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;  // clear counter to 0
    // Set period for timer using symbol PWM_PERIOD_COUNTS from user.h
    PR2 = PWM_PERIOD_COUNTS - 1;

    // Initialize OC5. See details in Section 16 (Output Compare) 
    // of the PIC32 Family Reference Manual. Use Pulse Width Modulation, which 
    // is described in Section 16.3.3.
    // Set initial duty cycle to 50%
    OC5R = PWM_PERIOD_COUNTS/2;
    // Set reload duty cycle to 50%
    OC5RS = PWM_PERIOD_COUNTS/2;
    // Configure OC5 control register
    OC5CONbits.ON = 1;  // Turn on OC5
    OC5CONbits.OC32 = 0;    // Select 16 bit mode
    OC5CONbits.OCTSEL = 0; // Select timer 2
    OC5CONbits.OCM = 6; // Select PWM mode without fault pin
    
    // Configure Peripheral Pin Select to connect OC5 output signal to pin G6,
    // which drives LED LD1.
    // See details in Section 12.4 of the PIC32MZ EF Data Manual.
    // There is also general information in Section 12.3.1 of the PIC32 Family 
    // Reference Manual.
    RPG6R = 11; // Select OC5

    // Start Timer 2
    T2CONbits.ON = 1;
}
#define VER 2   //ver 1 - control with potentiometer, ver2 - control with mic

#if VER==1 

/*!
Config for control led brightness
*/
void AdjustLED1Brightness(void) {
    unsigned int pot_pos = 0, on_time_counts=0;
   
    // Read potentiometer value using ADC
    pot_pos = ReadPotentiometerWithADC();
    // Convert potentiometer value to on-time (counts)
    on_time_counts = (pot_pos*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
    // Update OC5RS with new on-time count
    OC5RS = pot_pos;
}

#elif VER==2
void AdjustLED1Brightness(void) {
    unsigned int mic = 0, counts=0;
   
    // Read mic value using ADC
    mic = ReadMicWithADC();
    // Convert mic value to on-time (counts)
    counts = (mic*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
    // Update OC5RS with new on-time count
    OC5RS = mic;

}


#endif

/*!
Initialization GPIO
*/
void InitGPIO(void) {
    /* Setup functionality and port direction */
    //Enable potentiometer
    ANSELBbits.ANSB13 = 1;
    // LED output
    // Disable analog mode
    ANSELG &= ~(L_N(1,6) | L_N(1,15));
    TRISG &= ~(L_N(1,6) | L_N(1,15));  
    // Set directions to output
    // Disable analog mode for B11
    ANSELB &= ~L_N(1,11);
    // Set direction to output for G6
    TRISB &= ~L_N(1,11);
    
    // Disable analog mode for D4
    PORTD &= ~L_N(1,4);// For LED2 on PORTD pin 4 there is no analog option so ANSELDbits.ANSD4 = 0 is not required and will give compile errors.

    // Set direction to output for D4
    TRISD &= ~L_N(1,4);

    // Turn off LEDs for initialization
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

    // Button inputs
    // Disable analog mode
    ANSELA &= ~L_N(1,5);
    
    // Set directions to input
    TRISA |= L_N(1,5);
    // Initialize input for BTN2
    // No analog on RA4
    // Set directions to input
    TRISA |= L_N(1,4);
}

/*!
Call functions which initialize peripherals: GPIO, ADC, Timer2, OC5
*/
void InitApp(void) {
    // Add code to call functions which initialize peripherals: GPIO, ADC, Timer2, OC5
    InitGPIO();
    initWiFIREadc();
    InitTimer2AndOC5();
}