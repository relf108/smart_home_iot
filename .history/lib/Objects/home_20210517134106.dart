import 'package:smart_home_iot/Objects/motion_state.dart';
import 'package:smart_home_iot/smart_home_iot.dart';

class Home {
  Home(this.motionState, this.temp, this.brightness);
  Home.off() {
    motionState = temp = 0;
    brightness = 0;
  }
  MotionState motionState =
      MotionState(Timer(const Duration(seconds: 0), () => {}));
  double temp= 0;
  double brightness = 0;
}
