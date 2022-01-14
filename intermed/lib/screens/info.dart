import 'package:flutter/material.dart';
import 'package:intermed/misc/colors.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Цаг авалт'),
            backgroundColor: Colors.black,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Цаг авалт',
                  icon: Icon(
                    Icons.medical_services,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: 'Шинжилгээний хариу',
                  icon: Icon(
                    Icons.local_hospital_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
