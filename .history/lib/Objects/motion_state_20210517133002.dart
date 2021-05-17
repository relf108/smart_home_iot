import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  Timer timer = Timer(duration, callback);
  MotionState(this.timer) {
    this.timer = timer;
  }
}
