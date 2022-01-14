import 'package:flutter/material.dart';
import 'package:intermed/misc/colors.dart';

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

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
                text: 'Эмчээр',
                icon: Icon(
                  Icons.medical_services,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: 'Тасгаар',
                icon: Icon(
                  Icons.local_hospital_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
        ),
        body: TabBarView(
          children: [
            Center(
                child: Column(
              children: [
                Text("emch3"),
                Text("emch3"),
                Text("emch3"),
                Text("emch3"),
              ],
            )),
            Center(child: Text('Эмч2')),
          ],
        ),
      ));
}

// };
//search code
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Ковид онлайн зөвөлгөө',
    'Гэмтэл, согог',
    'Хоол боловсруулах',
    'Зүрх, судас',
    'Уушги',
    'Бөөр',
    'Нүд',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ' ';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    // search code
  }
}
