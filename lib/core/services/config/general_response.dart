import 'package:busha_mobile_test/core/services/config/_export_.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GeneralResponse<T> extends Equatable {
  final bool success;
  final ApiErrorResponse? error;
  final Map? data;

  const GeneralResponse({
    this.success = false,
    this.error,
    this.data,
  });

  factory GeneralResponse.fromJson(Either<Failure, Success> json) {
    return json.fold(
      (failure) => GeneralResponse(
        error: failure.error,
      ),
      (success) => GeneralResponse(
        success: true,
        data: success.data,
      ),
    );
  }

  @override
  List<Object?> get props => [
        success,
        error,
        data,
      ];
}
