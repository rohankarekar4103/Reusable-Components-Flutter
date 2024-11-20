import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_mobility_componentdevelopment_flutter/bloc/result_state.dart';
import 'package:yash_mobility_componentdevelopment_flutter/model/response/employee_details.dart';
import 'package:yash_mobility_componentdevelopment_flutter/repository/api_repository.dart';
import 'package:yash_mobility_componentdevelopment_flutter/services/network_exceptions.dart';
import '../services/api_result.dart';

class EmployeeDetailsBloc extends Cubit<ResultState<List<EmployeeDetails>>> {
  final APIRepository repository;

  EmployeeDetailsBloc({required this.repository}) : super(const Idle());

  //cal fetchEmployeeDetails method from ApiRepository and return data with ResultState
  fetchEmployeeDetails() async {
    // emit: emit the state or state with data that defined in class ResultState
    emit(const ResultState.loading());
    ApiResult<List<EmployeeDetails>> employeeList =
        await repository.fetchEmployeeDetails();
    employeeList.when(success: (List<EmployeeDetails> detailList) {
      emit(ResultState.data(detailList));
    }, failure: (NetworkExceptions exception) {
      emit(ResultState.error(exception));
    });
  }
}
