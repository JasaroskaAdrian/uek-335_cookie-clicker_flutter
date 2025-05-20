import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoCookie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF8B5E3C), // warm cookie brown
      brightness: Brightness.light,
      ),
    ),
    darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xFFD7B899), // lighter cookie brown for dark mode
        brightness: Brightness.dark,
      ),
    ),
    themeMode: ThemeMode.system,
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  int _cookieCounter = 0;
  int _totalCookiesCollected = 0;
  final stopwatch = Stopwatch();

  void _incrementCounter() {
    if (!stopwatch.isRunning) {
      stopwatch.start();  
    }
    double stopwatchMin = stopwatch.elapsedMilliseconds / 1000.0;
    setState(() {
      _cookieCounter++;
      _totalCookiesCollected++;
    });
  }
  double get stopwatchMin => stopwatch.elapsedMilliseconds / 1000.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> pages = <Widget>[
      /// Home Page - Cookie Counter
      Scaffold(
        appBar: AppBar(
          title: const Text('ChronoCookie'),
          backgroundColor: theme.colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('Cookie Counter:'),
              Text(
                '$_cookieCounter',
                style: theme.textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const CircleBorder(),
                backgroundColor: theme.colorScheme.primaryContainer,
                ),
                child: Image.asset(
                  'assets/icon/CookieLogo.png',
                  height: 300,
                  width: 300,
                ),
              ),

            ],
          ),
        ),
        
      ),

      /// Shop Upgrades Page (placeholder)
      Scaffold(
        appBar: AppBar(title: const Text('Shop Upgrades')),
        body: Center(child: 
        Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Icon(Icons.upgrade),
            title: Text('Upgrade Cookie Dough'),
            subtitle: Text('Increases cookies/sec by 0.2'),
            trailing: ElevatedButton(
              onPressed: () {
                // Buy logic
                if (_cookieCounter >= 50) {
                  _cookieCounter - 50;
                  
                };
              },
            child: Text('Buy for (50 🍪)'),
    ),
  ),
)),
      ),

      /// Settings Page (placeholder)
      Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: const Center(
          child: Text('Configure your app settings here')),
          
      ),

      /// Stats Page (example stats layout)
      Scaffold(
        appBar: AppBar(title: Text('Stats')),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text('Cookies Collected: $_totalCookiesCollected'),
                  subtitle: Text('Track how many cookies you have collected in total'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('Time Played'),
                  subtitle: Text('Track how long you’ve played: $stopwatchMin seconds'),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.store),
            label: 'Shop Upgrades',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
