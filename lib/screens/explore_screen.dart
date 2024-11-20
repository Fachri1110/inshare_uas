import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart'; 
import '../widgets/media_grid.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(4), 
          child: SizedBox(
            height: 50,
            width: 350, 
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0), 
                  child: PhosphorIcon(
                    PhosphorIconsRegular.magnifyingGlass,
                    color: Colors.black54,
                    size: 32, 
                  ),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: 'LexendDeca',
                  color: Colors.grey.shade600,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16), 
          Expanded(
            child: MediaGrid(), 
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8), 
              child: PhosphorIcon(
                _currentIndex == 0
                    ? PhosphorIconsBold.house 
                    : PhosphorIconsRegular.house, 
                size: 32,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: PhosphorIcon(
                _currentIndex == 1
                    ? PhosphorIconsBold.magnifyingGlass
                    : PhosphorIconsRegular.magnifyingGlass,
                size: 32,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: PhosphorIcon(
                _currentIndex == 2
                    ? PhosphorIconsBold.plusSquare
                    : PhosphorIconsRegular.plusSquare,
                size: 32,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: PhosphorIcon(
                _currentIndex == 3
                    ? PhosphorIconsBold.userCircle
                    : PhosphorIconsRegular.userCircle,
                size: 32,
                color: Colors.black,
              ),
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.black54, 
      ),
    );
  }
}
