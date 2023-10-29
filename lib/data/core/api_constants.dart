class ApiConstants {
  const ApiConstants._();

  static const baseUrl = 'https://dog.ceo/api';
  static const breeds = '/breeds/list/all';
  static String image(String breed) => '/breed/$breed/images/random/1';
  static String subImages(String breed, String subBreed) =>
      '/breed/$breed/$subBreed/images';
  static String randomBreedImages(String breed) =>
      '/breed/$breed/images/random';
}
