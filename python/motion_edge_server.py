from pyduino import * # allows easy serial communication with arduino
import time
import requests

# uses default serial port, baud and timeout settings for Arduino class
arduino_connection = Arduino()

# allow time for serial connection to establish
time.sleep(3)

# initialise motion sensor as input
MOTION_PIN = 11
arduino_connection.set_pin_mode(MOTION_PIN,'I')

# allow time to make connection
time.sleep(1)

# endlessly send HTTP requests for state of house and communicate this with Arduino
while True:
    # read motion state from Arduino
    motionState = arduino_connection.digital_read(11)

    # send motion state info to backend
    request = requests.post('/setMotionDetected' + motionState)