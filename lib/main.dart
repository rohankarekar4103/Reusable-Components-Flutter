import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_mobility_componentdevelopment_flutter/bloc/employee_details_bloc.dart';
import 'package:yash_mobility_componentdevelopment_flutter/repository/api_repository.dart';
import 'package:yash_mobility_componentdevelopment_flutter/view/employee_list.dart';
import 'package:flutter_logs/flutter_logs.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Logging
  await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device","network","errors"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "MyLogs",
      logsExportDirectoryName: "MyLogs/Exported",
      debugFileOperations: true,
      isDebuggable: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider<EmployeeDetailsBloc>(
        create: (BuildContext context){
          FlutterLogs.logInfo("API_CALL", "main.dart", "main called");
          return EmployeeDetailsBloc(repository: APIRepository());
        }, child: const EmployeeList(),
    )
    ],
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeeList(),
    ),
    );

  }
}

