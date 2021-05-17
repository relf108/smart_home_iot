import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  bool state;
  Timer timer;
  // ignore: sort_constructors_first
  MotionState(bool state, Timer timer) {
    this.state = state;
    this.timer = timer;
  }
}
