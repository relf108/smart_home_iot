from pyduino import * # allows easy serial communication with arduino
import time
import requests

# uses default serial port, baud and timeout settings for Arduino class
arduino_connection = Arduino()

# allow time for serial connection to establish
time.sleep(3)

# initialise buzzer as output
BUZZER_PIN = 11
arduino_connection.set_pin_mode(BUZZER_PIN,'O')

# initialise LED as output
LED_PIN = 10
arduino_connection.set_pin_mode(LED_PIN,'O')

# allow time to make connection
time.sleep(1)

# endlessly send HTTP requests for state of house and communicate this with Arduino
while True:
    # whether motion has been detected in the last five minutes
    request = requests.get('/getMotionState')
    key, value = request.split(':') # e.g. "motionState":"true"

        # If there is motion, send light and temperature to arduino (if applicable) 
        if value == 'true':
            
            # get temperature
            request = requests.get('/getTemp')
            key, value = request.split(':') # e.g. "temp":"20"
            # rule that if temperature is above 30, sound the alarm
            if value > 30:
                arduino_connection.digital_play(BUZZER_PIN, 500)

            # get softpot value for light brightness
            request = requests.get('/getBrightness')
            key, value = request.split(':') # e.g. "brightness":"600"
            # convert softpot scale from 0 - 1023 to 0 - 255 and set the LED accordingly
            adjusted_softpot = (255 / 1023) * float(value) 
            arduino_connection.analog_write(LED_PIN, adjusted_softpot)