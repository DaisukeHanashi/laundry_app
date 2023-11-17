import '../screens/service_detail_screen.dart';

class FavoritesManager {
  static List<ServiceDetail> favoriteServices = [];

  static void addToFavorites(ServiceDetail service) {
    favoriteServices.add(service);
  }

  static void removeFromFavorites(ServiceDetail service) {
    favoriteServices.remove(service);
  }
}