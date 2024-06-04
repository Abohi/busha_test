import 'package:equatable/equatable.dart';

abstract class ApiResponse {}

class Success extends ApiResponse with EquatableMixin {
  final Map<String, dynamic> data;

  Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Failure extends ApiResponse with EquatableMixin {
  final ApiErrorResponse error;

  Failure(this.error);

  factory Failure.fromMap(Map<String, dynamic> json) {
    return Failure(
      ApiErrorResponse(data: json),
    );
  }

  @override
  List<Object?> get props => [error];
}

enum ApiErrorType { unknown }

class ApiErrorResponse extends Equatable {
  final ApiErrorType type;
  final Map<String, dynamic>? data;
  final int? errorCode;
  final bool? shouldDisplayError;

  const ApiErrorResponse({
    this.type = ApiErrorType.unknown,
    this.data,
    this.errorCode,
    this.shouldDisplayError,
  });

  @override
  List<Object?> get props => [
        type,
        data,
        errorCode,
        shouldDisplayError,
      ];
}
