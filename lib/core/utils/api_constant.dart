const String signUpEndPoint = 'https://test.kafiil.com/api/test/user/register';
const String loginEndPoint = 'https://test.kafiil.com/api/test/user/login';
const String servicesEndPoint = 'https://test.kafiil.com/api/test/service';
const String servicesPopularEndPoint =
    'https://test.kafiil.com/api/test/service/popular';

String countriesEndPoint(int page) =>
    'https://test.kafiil.com/api/test/country?page=$page';
