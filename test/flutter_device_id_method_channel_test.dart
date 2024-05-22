import 'package:flutter/services.dart';
import 'package:flutter_device_id/flutter_device_id_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterDeviceId platform = MethodChannelFlutterDeviceId();
  const MethodChannel channel = MethodChannel('flutter_device_id');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getDeviceId', () async {
    expect(await platform.getDeviceId(), '42');
  });
}
