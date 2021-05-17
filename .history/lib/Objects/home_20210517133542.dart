import 'package:smart_home_iot/Objects/motion_state.dart';

class Home {
  Home(this.motionState, this.temp, this.brightness);
  Home.off(){
    MotionState motionState = MotionState(timer)
  }
  MotionState motionState;
  double temp;
  double brightness;
}
