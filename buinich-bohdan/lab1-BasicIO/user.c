/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */

/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/
#define L_N(i, n) ((i) << (n))

void initApp(void) {
    /* Setup analog functionality and port direction */

    // LED output
    // Disable analog mode for G6 and G15
    ANSELG &= ~(L_N(1,6) | L_N(1,15));
    // Set direction to output for G6 and G15
    TRISG &= ~(L_N(1,6) | L_N(1,15));  
    
    // Disable analog mode for B11
    ANSELB &= ~L_N(1,11);
    // Set direction to output for G6
    TRISB &= ~L_N(1,11);
    
    // Disable analog mode for D4
    PORTD &= ~L_N(1,4);// For LED2 on PORTD pin 4 there is no analog option so ANSELDbits.ANSD4 = 0 is not required and will give compile errors.

    // Set direction to output for D4
    TRISD &= ~L_N(1,4);
    
    // Turn on LEDs for testing
    // LD1_PORT_BIT =  LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 1; /
    
    // Turn off LEDs for testing
    LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD2_PORT_BIT = 0; //TURN Off G6
    
    // Stop program here
    //while(1); //infinity
    // BTN1 input
    
    // Disable analog mode
    ANSELA &= ~L_N(1,5);
    
    // Set directions to input
    TRISA |= L_N(1,5);
    // Initialize input for BTN2
     // No analog on RA4
     // Set directions to input
    TRISA |= L_N(1,4);
    
    // Test switches
   /* 
    while (1) {
        LD1_PORT_BIT = BTN1_PORT_BIT;
        LD2_PORT_BIT = BTN2_PORT_BIT;
};
*/
    //flash_LED(); //test led
}

void delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void flash_LED(void) {
    uint32_t delay_count = 1000000;
        PORTG  |= L_N(1,6); // Turn on LED
        delay(delay_count);
        PORTG &= ~L_N(1,6);// Turn off LED
        delay(delay_count);
    }

#define VER 2   //ver 1 - standart tast for lab1, ver2 - my code

#if VER==1 

void scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    uint32_t delay_count=1000000;

    while (1) {
        if (BTN1_PORT_BIT) { // btn1 pressed
            delay_count = 300000;
        } else {    // btn1 unpressed
            delay_count = 1000000;
        }

        if (BTN2_PORT_BIT) { // btn2 pressed
            // turn of all leds
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
        } else {
            LD1_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD4_PORT_BIT = LED_state;
            delay(delay_count);

// next time, set LEDs to opposite state
            LED_state =  !LED_state; 
        }
    }
}

#elif VER==2

void scan_LEDs(void) { //when btn1 pressed LEDs begin to glow from first to last and each time increase the delay
int LED_state = 1; // 1 on (initial value), 0 off
    uint32_t delay_count=100000;
    if (BTN1_PORT_BIT) { // btn1 pressed
        LD1_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD4_PORT_BIT = LED_state;
            delay(delay_count);

// next time, set LEDs to opposite state
            LED_state =  !LED_state; 
          // increase the delay
            delay_count += 100000;
    }else{
     // turn of all leds
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
    }

    if (BTN2_PORT_BIT) { // when btn2 pressed LEDs begin to glow from the last to the first and each time reduce the delay
            LD4_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD1_PORT_BIT = LED_state;
            delay(delay_count);

            // next time, set LEDs to opposite state
            LED_state =  !LED_state; 
           // reduce the delay
            delay_count -= 10000;

            }
    else{
     // turn of all leds
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
    }
}
#endif
