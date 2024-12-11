import 'package:booklyapp/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(context, String? link) async {
  if (link != null) {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      customSnackBar(context, message: 'Cannot Launch URL');
    }
  }
}
