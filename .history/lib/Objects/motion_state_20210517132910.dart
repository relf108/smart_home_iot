import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  Timer timer = Timer(duration, callback);
  MotionState(bool state, Timer timer) {
    this.timer = timer;
  }
}
