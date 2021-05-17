import 'package:smart_home_iot/Objects/motion_state.dart';
import 'package:smart_home_iot/smart_home_iot.dart';

class Home {
  Home(this.motionState, this.temp, this.brightness);
  Home.off() {
    MotionState motionState =
        MotionState(Timer(const Duration(seconds: 0), () => {}));
    temp = 0;
    brightness = 0;
  }

}
