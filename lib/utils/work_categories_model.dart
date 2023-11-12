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
    image: AppImages.laundry,
    name: AppText.laundry,
  ),
  WorkCategories(
    image: AppImages.laundry,
    name: AppText.plumbing,
  ),WorkCategories(
    image: AppImages.laundry,
    name: AppText.laundry,
  ),WorkCategories(
    image: AppImages.laundry,
    name: AppText.carWash,
  ),
  WorkCategories(
    image: AppImages.laundry,
    name: AppText.laundry,
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
    image: AppImages.laundryPerson,
    title: AppText.laundry,
    placeFar: AppText.laundry,
    rating: AppText.laundry,
    rate: AppText.laundry,
  ),
  ServicesDetails(
    image: AppImages.laundryPerson,
    title: AppText.laundry,
    placeFar: AppText.laundry,
    rating: AppText.laundry,
    rate: AppText.laundry,
  ),
  ServicesDetails(
    image: AppImages.laundryPerson,
    title: AppText.laundry,
    placeFar: AppText.laundry,
    rating: AppText.laundry,
    rate: AppText.laundry,
  ),
  ServicesDetails(
    image: AppImages.laundryPerson,
    title: AppText.laundry,
    placeFar: AppText.laundry,
    rating: AppText.laundry,
    rate: AppText.laundry,
  ),

];
