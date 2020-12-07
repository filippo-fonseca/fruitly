import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioService {
  final String _authToken = DotEnv().env["AUTH_TOKEN"];
  final String _accountSid = DotEnv().env["ACCOUNT_SID"];
  final String _twilioNumber = DotEnv().env["TWILIO_NUMBER"];

  Future<void> sendSMS(String message, String userPhone) async {
    TwilioFlutter twilioFlutter = TwilioFlutter(
      twilioNumber: _twilioNumber,
      accountSid: _accountSid,
      authToken: _authToken,
    );

    await twilioFlutter.sendSMS(
      toNumber: userPhone,
      messageBody: message,
    );
  }
}
