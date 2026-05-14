import 'package:portfolio/core/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  try {
    final uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      LoggerService.logError('Invalid URL or cannot be launched', null, null);
      throw Exception('Invalid URL or cannot be launched');
    }

    final success = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, 
    );

    if (!success) {
      LoggerService.logError('Could not launch URL', null, null);
      throw Exception('Could not launch URL');
    }
  } catch (e, stackTrace) {
    LoggerService.logError('Error opening CV', e, stackTrace);
  }
}