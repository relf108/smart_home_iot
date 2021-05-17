import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  bool state;
  Timer timer;
  MotionState(bool state, Timer timer) {
    this.state = state;
    this.timer = timer;
    timer.tick
  }
}
