class ApiEndPoint {
  static const String BaseUrl = 'https://api.themoviedb.org/3';
  static const String BearerToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjVhMGE1YzgxZTkxOWJhNmM3ZTdlM2ZhYWJjZmQwZiIsIm5iZiI6MTY2NjY1NzA0NC4xNTgwMDAyLCJzdWIiOiI2MzU3MmIxNDVmNGI3MzAwN2I4NmM1YjAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.CjAcAfkFU2HV-et8T3omUz-NoRCPV54hiaDFBk564JU';
  static const String ApiKey = '9b5a0a5c81e919ba6c7e7e3faabcfd0f';
  static String imagePath(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

}
