from pyduino import * # allows easy serial communication with arduino
import time
import requests

# uses default serial port, baud and timeout settings for Arduino class
arduino_connection = Arduino()

# allow time for serial connection to establish
time.sleep(3)

# initialise temperature sensor as input
TEMPERATURE_PIN = 11
arduino_connection.set_pin_mode(TEMPERATURE_PIN,'I')

# allow time to make connection
time.sleep(1)

# endlessly send HTTP requests for state of house and communicate this with Arduino
while True:
    # whether motion has been detected in the last five minutes
    request = requests.get('/getMotionState')
    key, value = request.split(':') # e.g. "motionState":"true"

    # If there is motion, allow sending of temperature information to backend
    if value == 'true':
        # read temperature from Arduino
        temperature = arduino_connection.analog_read(11)

        # send temperature value to backend
        request = requests.post('/setTemp/' + temperature)