import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  MotionState(this.timer);
  Timer timer;

  bool getState() {
    bool result = false;
    if (timer.isActive) {
      result = true;
    }
    return result;
  }
}
