class NetworkResponse {
  final bool isSuccess;
  final bool status;
  final int statusCode;
  final dynamic data;
  final String? message;

  NetworkResponse({
    required this.isSuccess,
    required this.status,
    required this.statusCode,
    this.data,
    this.message,
  });

  factory NetworkResponse.success(dynamic data, int? statusCode) {
    return NetworkResponse(
      isSuccess: true,
      status: true,
      statusCode: statusCode ?? -1,
      data: data,
    );
  }

  factory NetworkResponse.failure(String message, [int statusCode = -1]) {
    return NetworkResponse(
      isSuccess: false,
      status: false,
      statusCode: statusCode,
      message: message,
    );
  }
}