import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> getSecret() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? value;

  value = await storage.read(key: "supersecret");

  // If we cannot find the secret then it was never created (first run)
  // Then we create a one time secret and store it in encrypted shared preferences or the keychain
  if (value == null) {
    var random = "MyFistSecret"; // TODO in production: getRandomString(20);
    await storage.write(key: "supersecret", value: random);

    value = await storage.read(key: "supersecret");
  }

  return value;
}

String getRandomString(int length) {
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
