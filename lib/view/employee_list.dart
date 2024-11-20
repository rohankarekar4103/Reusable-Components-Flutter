import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_mobility_componentdevelopment_flutter/bloc/result_state.dart';
import 'package:yash_mobility_componentdevelopment_flutter/model/response/employee_details.dart';
import 'package:yash_mobility_componentdevelopment_flutter/bloc/employee_details_bloc.dart';
import 'package:yash_mobility_componentdevelopment_flutter/services/network_exceptions.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EmployeeListState();
  }
}

class _EmployeeListState extends State<EmployeeList> {
  late String name;
  late String contact;
  late String address;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EmployeeDetailsBloc>(context).fetchEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body:
          BlocBuilder<EmployeeDetailsBloc, ResultState<List<EmployeeDetails>>>(
              builder: (BuildContext context,
                  ResultState<List<EmployeeDetails>> state) {
        return state.when(idle: () {
          return Container();
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }, data: (List<EmployeeDetails> employeeDetails) {
          for (var i = 0; i <= employeeDetails.length;) {
            return dataWidget(employeeDetails);
          }
          return Container();
        }, error: (NetworkExceptions exceptions) {
          return Center(
              child: Text(NetworkExceptions.getErrorMessage(exceptions)));
        });
      }),
    );
  }

  Widget dataWidget(List<EmployeeDetails> employeeDetails) {
    return ListView.builder(
      itemCount: employeeDetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Card(
              elevation: 1,
              child: ListTile(
                leading: Image.network(
                  employeeDetails[index].imageUrl!,
                  colorBlendMode: BlendMode.darken,
                ),
                title: Text(
                  "Name: ${employeeDetails[index].firstName} ${employeeDetails[index].lastName}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "Email: ${employeeDetails[index].email}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Colors.blueGrey),
                ),
              )),
        );
      },
    );
  }
}
