import 'package:flutter/material.dart';

class ScrollSyncPage2 extends StatefulWidget {
  const ScrollSyncPage2({super.key});

  @override
  _ScrollSyncPageState createState() => _ScrollSyncPageState();
}

class _ScrollSyncPageState extends State<ScrollSyncPage2> {
  // Controllers for the scroll views
  ScrollController singleChildScrollViewController = ScrollController();
  ScrollController listViewController1 = ScrollController();
  ScrollController listViewController2 = ScrollController();

  // Flag to prevent recursive scroll triggering
  bool isScrolling = false;

  @override
  void dispose() {
    // Dispose controllers when not in use
    singleChildScrollViewController.dispose();
    listViewController1.dispose();
    listViewController2.dispose();
    super.dispose();
  }

  // Check for the first and last item scroll behavior
  void _checkListViewScroll(
      ScrollController listViewController, bool isFirstListView) {
    final currentOffset = listViewController.offset;
    final maxScroll = listViewController.position.maxScrollExtent;
    final minScroll = listViewController.position.minScrollExtent;

    // If the list view reaches the first item (scroll up), scroll the full screen
    if (currentOffset <= minScroll && !isScrolling) {
      setState(() {
        isScrolling = true;
      });
      Future.delayed(Duration(milliseconds: 100), () {
        // Scroll SingleChildScrollView up
        singleChildScrollViewController.jumpTo(
            singleChildScrollViewController.offset - 10);
        setState(() {
          isScrolling = false;
        });
      });
    }

    // If the list view reaches the last item (scroll down), scroll the full screen
    if (currentOffset >= maxScroll && !isScrolling) {
      setState(() {
        isScrolling = true;
      });
      Future.delayed(Duration(milliseconds: 100), () {
        // Scroll SingleChildScrollView down
        singleChildScrollViewController.jumpTo(
            singleChildScrollViewController.offset + 10);
        setState(() {
          isScrolling = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Sync Example")),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            // Detect scrolling and adjust SingleChildScrollView based on list view
            _checkListViewScroll(listViewController1, true);
            _checkListViewScroll(listViewController2, false);
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: singleChildScrollViewController,
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                  controller: listViewController1,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('First List Item $index'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 200, // Some content above the list
                color: Colors.red,
                child: const Center(child: Text("Header Section")),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  controller: listViewController1,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('First List Item $index'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  controller: listViewController2,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Second List Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
