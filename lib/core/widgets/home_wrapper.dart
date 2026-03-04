import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/home/presentation/screens/home_screen.dart';
import 'package:crypto_demo/features/home/presentation/widgets/bottom_navigation_widget.dart';
import 'package:crypto_demo/features/market/presentation/screens/market_screen.dart';
import 'package:crypto_demo/features/profile/presentation/screens/profile_screen.dart';
import 'package:crypto_demo/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MarketScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
