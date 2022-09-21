class ApiResponse<T>{
  final String message;
  final bool success;
  final T? object;

  ApiResponse(this.message,this.success, [this.object]);

}