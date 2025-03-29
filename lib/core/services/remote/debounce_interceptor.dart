import 'dart:async';
import 'package:dio/dio.dart';

class DebounceInterceptor extends Interceptor {
  final Duration debounceTime = const Duration(seconds: 2);
  Timer? _debounceTimer;
  CancelToken? _lastCancelToken;
  DebounceInterceptor();
  int count = 0;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // إلغاء أي طلب سابق قبل تنفيذ الجديد
    _lastCancelToken?.cancel("Cancelled due to new request");
    // Cancel previous timer if existing
    _debounceTimer?.cancel();

    // إنشاء CancelToken جديد للطلب الحالي
    _lastCancelToken = CancelToken();
    options.cancelToken = _lastCancelToken;

    _debounceTimer = Timer(debounceTime, () {
      count++;
      super.onRequest(options, handler);
    });
  }
}
