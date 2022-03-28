class EndPoints {
  EndPoints._();

  static const baseUrl = 'https://www.metaweather.com';

  static const forecast = '/api/location';

  static String fetchImage(String img) =>
      '$baseUrl/static/img/weather/$img.svg';
}
