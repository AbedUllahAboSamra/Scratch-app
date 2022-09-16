
import '../model/api_response.dart';

mixin ApiHelpers{

  ApiResponse get errorResponse => ApiResponse(message: 'something went wrong , try again',success: false);
}