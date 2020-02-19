class ResultData {
  final dynamic data;
  //网络请求是否成功
  final bool success;
  final int code;
  final dynamic headers;

  ResultData({this.data, this.success, this.code, this.headers});
}
