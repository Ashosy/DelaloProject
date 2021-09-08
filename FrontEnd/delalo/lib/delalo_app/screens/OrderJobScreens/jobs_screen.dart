import 'package:flutter/material.dart';
import 'activeJob.dart';
import 'historyJobs.dart';
import 'pendingJobs.dart';

class JobsScreen extends StatelessWidget {
  static const String routeName = '/jobs';
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.work), text: 'Jobs'),
                Tab(icon: Icon(Icons.history), text: 'History'),
              ],
            ),
            title: Center(
              child: Text(
                'Jobs',
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                ActiveJob(),
                HistoryJobs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}