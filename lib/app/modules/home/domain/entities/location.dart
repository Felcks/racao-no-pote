import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

Location getGMTLocation() {
  initializeTimeZones();
  return getLocation('Africa/Abidjan');
}

Location getBrazilianLocation() {
  initializeTimeZones();
  return getLocation('America/Sao_Paulo');
}
