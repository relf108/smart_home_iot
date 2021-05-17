import 'package:smart_home_iot/smart_home_iot.dart';

class MotionState {
  Timer timer = Timer(duration, callback);
  MotionState(Timer timer = new Timer(duration, callback)) {
    this.timer = timer;
  }
}
