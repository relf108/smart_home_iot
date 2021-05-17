import 'package:smart_home_iot/smart_home_iot.dart';

class SmartHomeIotChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/motionDetected").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/temperatureExceeded").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
