import 'package:flutter/material.dart';

class ScrollSyncPage extends StatelessWidget {
  const ScrollSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Synchronized Scrolling')),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // Smooth iOS-like scrolling
        slivers: [
          // Top fixed section
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),

          // First scrollable list
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, index) => Container(
                height: 70, // Fixed height for reliable scrolling
                color: index.isEven ? Colors.grey[200] : Colors.grey[300],
                child: ListTile(title: Text('List 1 - Item $index')),
              ),
              childCount: 30, // Enough items to overflow
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'Footer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          // Second scrollable list
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, index) => Container(
                height: 70,
                color: index.isEven ? Colors.green[100] : Colors.green[200],
                child: ListTile(title: Text('List 2 - Item $index')),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}