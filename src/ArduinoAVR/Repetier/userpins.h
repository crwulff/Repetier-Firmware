// Connector XLR 1 Driver
#define ORIG_X_STEP_PIN         45
#define ORIG_X_DIR_PIN          47
#define ORIG_X_ENABLE_PIN       46

#define ORIG_X_MIN_PIN          41 /* XLR 4.3 */
#define ORIG_X_MAX_PIN          43 /* XLR 4.4 */

// Connector XLR 2 Drive
#define ORIG_Y_STEP_PIN         51
#define ORIG_Y_DIR_PIN          53
#define ORIG_Y_ENABLE_PIN       52

#define ORIG_Y_MIN_PIN          42 /* XLR 5.3 */
#define ORIG_Y_MAX_PIN          40 /* XLR 5.2 */

// Connector XLR 3 Driver
#define ORIG_Z_STEP_PIN         49
#define ORIG_Z_DIR_PIN          48
#define ORIG_Z_ENABLE_PIN       50

#define ORIG_Z_MIN_PIN          38 /* XLR 5.1 */
#define ORIG_Z_MAX_PIN          44 /* XLR 5.4 */

//
// Not currently used...
//

#define ORIG_E0_STEP_PIN         26
#define ORIG_E0_DIR_PIN          28
#define ORIG_E0_ENABLE_PIN       24

#define ORIG_E1_STEP_PIN         36
#define ORIG_E1_DIR_PIN          34
#define ORIG_E1_ENABLE_PIN       30

#define SDPOWER            -1
#define SDSS               53
#define SDCARDDETECT 	    49

#define LED_PIN            13
#define ORIG_FAN_PIN            9
#define PS_ON_PIN          12

#define HEATER_0_PIN       10
#define HEATER_1_PIN       8
#define HEATER_2_PIN       9
#define TEMP_0_PIN         13   // ANALOG NUMBERING
#define TEMP_1_PIN         14   // ANALOG NUMBERING
#define TEMP_2_PIN         15
#define E0_PINS ORIG_E0_STEP_PIN,ORIG_E0_DIR_PIN,ORIG_E0_ENABLE_PIN,
#define E1_PINS ORIG_E1_STEP_PIN,ORIG_E1_DIR_PIN,ORIG_E1_ENABLE_PIN,

// SPI for Max6675 Thermocouple

// these pins are defined in the SD library if building with SD support
#define SCK_PIN          52
#define MISO_PIN         50
#define MOSI_PIN         51
#define MAX6675_SS       53

