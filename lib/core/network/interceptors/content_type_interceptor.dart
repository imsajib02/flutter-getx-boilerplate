import 'package:http_interceptor/http_interceptor.dart';

class ContentTypeInterceptor implements InterceptorContract {

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {

    try {
      request.headers['Content-Type'] = 'application/json';
    } catch (e) {
      rethrow;
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async => response;

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => true;
}