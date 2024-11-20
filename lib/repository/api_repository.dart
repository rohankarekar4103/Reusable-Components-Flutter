import 'package:dio/dio.dart';
import 'package:yash_mobility_componentdevelopment_flutter/model/response/employee_details.dart';
import 'package:yash_mobility_componentdevelopment_flutter/services/dio_api_client.dart';
import '../services/api_result.dart';
import '../services/network_exceptions.dart';

class APIRepository {
  late DioApiClient apiClient;
  final String apiKey = "";
  String baseUrl =
      "https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001";

  APIRepository() {
    var dio = Dio();
    apiClient = DioApiClient(baseUrl, dio);
  }

  // Hit the API and return response
  Future<ApiResult<List<EmployeeDetails>>> fetchEmployeeDetails() async {
    List<EmployeeDetails> employeeList = [];
    try {
      Response response = await apiClient.get(baseUrl);
      if (response.statusCode == 200 && response.data != null) {
        response.data.forEach((e) {
          employeeList.add(EmployeeDetails.fromJson(e));
        });
      }
      return ApiResult.success(employeeList);
    } catch (exception) {
      return ApiResult.failure(NetworkExceptions.getNetworkException(exception));
    }
  }
}