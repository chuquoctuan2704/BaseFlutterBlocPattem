import 'package:base_flutter_bloc_pattem/app/core/utils/device_utils.dart';
import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});
  @override
  List<Object> get props => [message, statusCode ?? 400];
}

// General failures, need to be update
class ServerFailure extends Failure {
  const ServerFailure(String message, {int? statusCode})
      : super(message, statusCode: statusCode);

  static ServerFailure from(ServerException exception) {
    if(exception.statusCode == 401){
      DeviceUtils.restartApp();
    }
    return ServerFailure(exception.message, statusCode: exception.statusCode);
  }
}