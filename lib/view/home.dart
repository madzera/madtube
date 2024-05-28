import 'package:flutter/material.dart';
import 'package:madtube/view/component/custom_search_api.dart';
import 'package:madtube/view/highlight.dart';
import 'package:madtube/view/library.dart';
import 'package:madtube/view/start.dart';
import 'package:madtube/view/subscription.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  String _queryResult = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      StartPage(_queryResult),
      const HighLightPage(),
      const SubscriptionPage(),
      const LibraryPage()
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
          opacity: 0.8
        ),
        backgroundColor: Colors.white,
        title: const Text("MadTube"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? result = await showSearch(context: context, delegate: CustomSearch());
              if (result != null) {
                setState(() {
                  _queryResult = result;
                });
              }
            },
          )
          /*
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              print("acao: videocan");
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print("acao: pesquisa");
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              print("acao: conta");
            },
          ),*/
        ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.orange,
              height: 4.0,
            ),
          )
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
              label: "Biblioteca",
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}
