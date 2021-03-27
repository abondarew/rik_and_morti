
class ErrorResponseException implements Exception{
  final String errorMessage;

  ErrorResponseException({this.errorMessage});

  @override
  String toString() {
    if(errorMessage == null) {
      return ("Server unknown error!");
    }else{
      return ("Server error: $errorMessage");
    }
  }
}