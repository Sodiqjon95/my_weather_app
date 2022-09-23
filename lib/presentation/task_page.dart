import 'package:flutter/material.dart';
import 'package:my_weather_app/api/service/api_provider.dart';

import '../api/models/task_data.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isLoading = true;
  bool isError = false;
  late TaskData taskData;

  _init() async {
    try {
      isLoading = true;
      setState(() {});
      taskData = await ApiProvider.getTask();
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      isError = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Page"),
      ),
      body: RefreshIndicator(
        onRefresh: () async{ _init(); },
        child: Expanded(
          child: ListView(
            children:[ Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : isError
                  ? Text("error")
                  : Column(
                    children: [
                      Text(taskData.country_name),
                      Text(taskData.population_count),
                      Image.network(taskData.flag_image),
                    ],
                  ),
            ),]
             
          ),
        ),
      ),
    );
  }
}
