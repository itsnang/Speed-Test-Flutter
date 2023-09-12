import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelService {
  factory MixpanelService() {
    return _instance ??= MixpanelService._create();
  }
  MixpanelService._create() {
    initMixpanel();
  }

  static Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(
      '3ffa5791ec0783ac51d9245073b78dab',
      trackAutomaticEvents: true,
    );
  }

  static MixpanelService? _instance;
  static Mixpanel? mixpanel;
}
