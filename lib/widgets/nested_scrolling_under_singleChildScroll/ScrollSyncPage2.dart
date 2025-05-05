import 'package:flutter/material.dart';

class ScrollSyncPage2 extends StatefulWidget {
  const ScrollSyncPage2({super.key});

  @override
  _ScrollSyncPage2State createState() => _ScrollSyncPage2State();
}

class _ScrollSyncPage2State extends State<ScrollSyncPage2> {
  // Controller for the main scroll view
  final ScrollController mainScrollController = ScrollController();

  // Controllers for the list views
  final ScrollController listViewController1 = ScrollController();
  final ScrollController listViewController2 = ScrollController();
  final ScrollController listViewController3 = ScrollController();

  // Flag to prevent recursive scroll triggering
  bool isScrollingMain = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to each ListView controller to detect when they reach the end
    listViewController1.addListener(() => _handleListViewScroll(listViewController1, 0));
    listViewController2.addListener(() => _handleListViewScroll(listViewController2, 1));
    listViewController3.addListener(() => _handleListViewScroll(listViewController3, 2));
  }

  @override
  void dispose() {
    // Remove listeners and dispose controllers
    listViewController1.removeListener(() => _handleListViewScroll(listViewController1, 0));
    listViewController2.removeListener(() => _handleListViewScroll(listViewController2, 1));
    listViewController3.removeListener(() => _handleListViewScroll(listViewController3, 2));

    mainScrollController.dispose();
    listViewController1.dispose();
    listViewController2.dispose();
    listViewController3.dispose();
    super.dispose();
  }

  // Handle scroll events from ListViews
  void _handleListViewScroll(ScrollController controller, int listIndex) {
    if (isScrollingMain || !controller.hasClients) return;

    // Check if we've reached the end (bottom) of the ListView
    if (controller.position.pixels >= controller.position.maxScrollExtent) {
      // Start scrolling the main view upward (toward the top)
      _scrollMainViewUpward(listIndex);
    }
  }

  void _scrollMainViewUpward(int listIndex) {
    if (!mainScrollController.hasClients) return;

    // Mark that we're handling a scroll operation
    isScrollingMain = true;

    // Calculate target position based on which ListView triggered the scroll
    double targetPosition = 0;

    // Scroll up (decrease the offset) by a fixed amount
    // You might need to adjust this value based on your layout
    targetPosition = mainScrollController.offset - 100;

    // Ensure we don't scroll beyond the top edge
    targetPosition = targetPosition.clamp(0, mainScrollController.position.maxScrollExtent);

    // Animate to the new position
    mainScrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ).then((_) {
      // Reset flag when animation completes
      isScrollingMain = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reverse Scroll Sync Example")),
      body: SingleChildScrollView(
        controller: mainScrollController,
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.blue.shade100,
              child: const Center(child: Text("Top Section")),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 300,
              child: ListView.builder(
                controller: listViewController1,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('First List Item $index'),
                    tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 150,
              color: Colors.red.shade100,
              child: const Center(child: Text("Middle Section")),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 300,
              child: ListView.builder(
                controller: listViewController2,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Second List Item $index'),
                    tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 150,
              color: Colors.green.shade100,
              child: const Center(child: Text("Bottom Section")),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 300,
              child: ListView.builder(
                controller: listViewController3,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Third List Item $index'),
                    tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}