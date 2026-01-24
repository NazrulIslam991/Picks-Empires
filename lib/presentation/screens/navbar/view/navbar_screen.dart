import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/presentation/screens/casino/view/casino_screen.dart';
import 'package:picks_empire/presentation/screens/crypto/view/crypto_screen.dart';
import 'package:picks_empire/presentation/screens/home/view/home_screen.dart';
import 'package:picks_empire/presentation/screens/navbar/view_model/navbar_view_model.dart';
import 'package:picks_empire/presentation/screens/sports/view/sports_screen.dart';
import 'package:picks_empire/presentation/screens/strocks/view/strocks_screen.dart';

class NavbarScreen extends ConsumerWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navbarProvider);

    final List<Widget> screen = [
      HomeScreen(),
      SportsScreen(),
      StrocksScreen(),
      CryptoScreen(),
      CasinoScreen(),
    ];
    return Scaffold(
      extendBody: true,
      body: screen[index],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: Colors.white24),
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: index,
            onTap: (index) => ref.read(navbarProvider.notifier).setIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF00FF7F),
            selectedIconTheme: const IconThemeData(color: Color(0xFF00FF7F)),
            unselectedIconTheme: const IconThemeData(color: null),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.home,
                  height: 20,
                  width: 20,
                  color: index == 0 ? const Color(0xFF00FF7F) : Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.sports,
                  height: 20,
                  width: 20,
                  color: index == 1 ? const Color(0xFF00FF7F) : Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.strocks,
                  height: 20,
                  width: 20,
                  color: index == 2 ? const Color(0xFF00FF7F) : Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: 'Stocks',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.bitcoin,
                  height: 20,
                  width: 20,
                  color: index == 3 ? const Color(0xFF00FF7F) : Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: 'Crypto',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.casino,
                  height: 20,
                  width: 20,
                  color: index == 4 ? const Color(0xFF00FF7F) : Colors.grey,
                  colorBlendMode: BlendMode.srcIn,
                ),
                label: 'Casino',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
