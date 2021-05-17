import 'package:smart_home_iot/Objects/motion_state.dart';

class Home {
  Home(this.motionState, this.temp, this.brightness);
  MotionState motionState;
  double temp;
  double brightness;
}
