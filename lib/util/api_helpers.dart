
import '../model/api_response.dart';

mixin ApiHelpers{

  ApiResponse get errorResponse => ApiResponse( 'something went wrong , try again', false);
}