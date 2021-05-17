import 'package:smart_home_iot/Objects/motion_state.dart';

class Home {
  Home(this.motionState, this.temp, this.brightness);
  Home.off(){
    MotionState motionState = MotionState(Timer(Duration(seconds: 0), () => {}))
  }
  MotionState motionState;
  double temp;
  double brightness;
}
