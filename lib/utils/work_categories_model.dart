import 'app_image.dart';
import 'app_string.dart';


class WorkCategories {
  String? image;
  String? name;

  WorkCategories({
    this.image,
    this.name,

  });
}
List<WorkCategories> categoriesModel = [
  WorkCategories(
    image: AppImages.washiron,
    name: AppText.item1,
  ),
  WorkCategories(
    image: AppImages.washfold,
    name: AppText.item2,
  ),WorkCategories(
    image: AppImages.dryclean,
    name: AppText.item3,
  ),WorkCategories(
    image: AppImages.laundry,
    name: AppText.item4,
  ),
  

];

class ServicesDetails {
  String? image;
  String? title;
  String? placeFar;
  String? rating;
  String? rate;

  ServicesDetails({
    this.image,
    this.title,
    this.placeFar,
    this.rating,
    this.rate,
  });
}
List<ServicesDetails>  servicesDetails =[
  ServicesDetails(
    image: AppImages.berryclean,
    title: AppText.shop,
    placeFar: AppText.location1,
    rating: AppText.rate,
    rate: AppText.price,
  ),
  ServicesDetails(
    image: AppImages.rinse,
    title: AppText.shop1,
    placeFar: AppText.location2,
    rating: AppText.rate1,
    rate: AppText.price,
  ),
  ServicesDetails(
    image: AppImages.tumbledry,
    title: AppText.shop2,
    placeFar: AppText.location3,
    rating: AppText.rate2,
    rate: AppText.price,
  ),
  ServicesDetails(
    image: AppImages.washerman,
    title: AppText.shop3,
    placeFar: AppText.location4,
    rating: AppText.rate3,
    rate: AppText.price,
  ),

];

class ServiceImage {
  String? image;
  String? name;

  ServiceImage({
    this.image,
    this.name,

  });
}
List<ServiceImage> serviceModel = [
  ServiceImage(
    image: AppImages.berryclean,
    name: AppText.item1,
  ),
  ServiceImage(
    image: AppImages.rinse,
    name: AppText.item2,
  ),
  ServiceImage(
    image: AppImages.tumbledry,
    name: AppText.item3,
  ),
  ServiceImage(
    image: AppImages.washerman,
    name: AppText.item4,
  ),
];

class StoreNames {
  String? image;
  String? name;

  StoreNames({
    this.image,
    this.name,

  });
}
List<StoreNames> storeNames = [
  StoreNames(
    image: AppImages.berryclean,
    name: AppText.shop,
  ),
  StoreNames(
    image: AppImages.rinse,
    name: AppText.shop1,
  ),
  StoreNames(
    image: AppImages.tumbledry,
    name: AppText.shop2,
  ),
  StoreNames(
    image: AppImages.washerman,
    name: AppText.shop3,
  ),
];

class Message {
  String sender;
  String text;

  Message({
    required this.sender,
    required this.text,
  });
}