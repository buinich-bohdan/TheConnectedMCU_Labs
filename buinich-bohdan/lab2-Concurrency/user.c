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

volatile uint32_t G_Allow_Lit_LEDs = 1; // Allow LEDs to be on initially
volatile int32_t G_Position = 0; // Position of rope
#define L_N(i, n) ((i) << (n))

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void initApp(void) {
    /* Setup analog functionality and port direction */
    // LED outputs
    // Disable analog mode if present
    ANSELG &= ~(L_N(1,6) | L_N(1,15));
    ANSELB &= ~L_N(1,11);
    
    // Set direction to output 
    TRISG &= ~L_N(1,6); 
    TRISB &= ~L_N(1,11);
    TRISD &= ~L_N(1,4);
    // Turn off LEDs for initialization
    LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
    
    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &= ~L_N(1,5);
    // Set directions to input
    TRISA |= L_N(1,5);
    TRISA |= L_N(1,4);

    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= L_N(1,5);
    CNENA |= L_N(1,4);
    // 4. Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 2;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // 5. Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // 6. Globally enable interrupts
    __builtin_enable_interrupts();
    // 7. Enable peripheral
    CNCONAbits.ON = 1;

}

void delay(int n) {
    volatile uint32_t i;
    for (i = 0; i < n; i++) {
    }
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
       G_Position = BTN2_PORT_BIT ? G_Position : G_Position +1; // plus 1 for right player
    }
            else if (CNSTATAbits.CNSTATA5) { // Bit 5 (BTN1) changed
       G_Position = BTN1_PORT_BIT ? G_Position : G_Position -1; // plus 1 for right player
    
            }
     // Reset interrupt flag
    task_update_leds();
    IFS3bits.CNAIF = 0;
    }
 
void task_update_leds (void) { //Position of the virtual rope
if(-4 >= G_Position) {      // left player win
        scan_leds(0);
    } else if (4 <= G_Position) { // right player win
        scan_leds(1);
    } else {
    switch(G_Position){
            case (-3): 
                set_leds(1, 0, 0, 0);
                break;
            case (-2): 
                set_leds(1, 1, 0, 0);
                break;  
            case (-1): 
                set_leds(0, 1, 0, 0);
                break;    
            case 0: 
                set_leds(0, 1, 1, 0);
                break;
            case 1: 
                set_leds(0, 0, 1, 0);
                break; 
            case 2: 
                set_leds(0, 0, 1, 1);
                break;  
            case 3: 
                set_leds(0, 0, 0, 1);
                break;  
        default: 
            break;    
    }
    }

}


void set_leds (uint32_t l1, uint32_t l2, uint32_t l3, uint32_t l4) {    //function to setting right leds on
    LD1_PORT_BIT = l1;
    LD2_PORT_BIT = l2;
    LD3_PORT_BIT = l3;
    LD4_PORT_BIT = l4;
}

void scan_leds(uint32_t dir_lr) {  
    volatile uint32_t i = 5;  
    if (dir_lr) {      // if win right playe
        for (i; i > 0; i--){ 
            set_leds(1, 0, 0, 0);
            delay(1000000);
            set_leds(0, 1, 0, 0);
            delay(1000000);
            set_leds(0, 0, 1, 0);
            delay(1000000);
            set_leds(0, 0, 0, 1);
            delay(1000000);
        }
    } else if (!dir_lr) {  // if win left player
        for (i; i > 0; i--){
            set_leds(0, 0, 0, 1);
            delay(1000000);
            set_leds(0, 0, 1, 0);
            delay(1000000);
            set_leds(0, 1, 0, 0);
            delay(1000000);
            set_leds(1, 0, 0, 0);
            delay(1000000);
            
        }
    }
            G_Position = 0; //start game
            task_update_leds();
}
