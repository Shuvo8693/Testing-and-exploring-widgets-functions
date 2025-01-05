import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> _tab = [
    const Tab(
      text: 'button 1',
      icon: Icon(Icons.home),
    ),
    const Tab(
      text: 'button 2',
      icon: Icon(Icons.house_siding_sharp),
    ),
    const Tab(
      text: 'button 3',
      icon: Icon(Icons.villa_outlined),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tab.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 65,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black,offset: Offset(0, 1))],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: TabBar(
                tabs: _tab,
                controller: _tabController,
                dividerHeight: 0,
              ),
            ),
          ),
          Flexible(
            child: TabBarView(controller: _tabController, children: const [
              Icon(Icons.person_outline_outlined),
              Icon(Icons.accessibility),
              Icon(Icons.add_a_photo_outlined),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}