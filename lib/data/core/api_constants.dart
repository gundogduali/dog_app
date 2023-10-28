class ApiConstants {
  const ApiConstants._();

  static const baseUrl = 'https://dog.ceo/api';
  static const breeds = '/breeds/list/all';
  static String images(String breed) => '/breed/$breed/images';
  static String subImages(String breed, String subBreed) =>
      '/breed/$breed/$subBreed/images';
  static String randomBreedImages(String breed) =>
      '/breed/$breed/images/random';
}
