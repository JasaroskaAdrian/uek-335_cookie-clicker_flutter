import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChronoCookie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5E3C),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD7B899),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      home: NavigationExample(toggleTheme: toggleTheme),
    );
  }
}

class NavigationExample extends StatefulWidget {
  final VoidCallback toggleTheme;
  const NavigationExample({super.key, required this.toggleTheme});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  int _cookieCounter = 0;
  int _totalCookiesCollected = 0;
  final stopwatch = Stopwatch();
  int cookieDoughLevel = 0;
  int cookieOvenLevel = 0;
  int chocolateChips = 0;
  int bakingGloves = 0;
  int grandmasTouch = 0;
  int grandsmasSecretRecipe = 0;
  int sugarBoost = 0;
  int magicWhisk = 0;
  int autoMixer = 0;
  int instaCookieMachine = 0;

  Timer _autoClickerTimer = Timer(Duration.zero, () {});

  void _incrementCounter() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
    }
    setState(() {
      _cookieCounter++;
      _totalCookiesCollected++;
    });
  }

  void startAutoClicker() {
    _autoClickerTimer.cancel();

    if (cookieDoughLevel > 0) {
      double cookiesPerSecond = cookieDoughLevel * 0.5;
      final durationLevel1 = Duration(milliseconds: (1000 / cookiesPerSecond).round());

      _autoClickerTimer = Timer.periodic(durationLevel1, (timer) {
        setState(() {
          _cookieCounter++;
          _totalCookiesCollected++;
        });
      });
    }
  }

  double get stopwatchSec => stopwatch.elapsedMilliseconds / 1000.0;

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
  body: ListView(
    padding: const EdgeInsets.all(8),
    children: [
      Card(
        child: ListTile(
          leading: Icon(Icons.cookie),
          title: Text('Upgrade Cookie Dough, Level: $cookieDoughLevel'),
          subtitle: Text('Each Level increases cookies/sec by 0.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 50) {
                setState(() {
                  _cookieCounter -= 50;
                  cookieDoughLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 50 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 450 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 1350 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 4050 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 12150 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 36450 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 109350 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 328050 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 984150 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.fireplace),
          title: Text('Upgrade Cookie Oven, Level: $cookieOvenLevel'),
          subtitle: Text('Each Level increases cookies/sec by 1.5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 150) {
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text('Buy for 2952450 🍪'),
          ),
        ),
      ),
      ]
    )
  ),

      /// Settings Page (placeholder)
      /// Settings Page
      Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Center(
          child: ElevatedButton.icon(
            onPressed: widget.toggleTheme,
            icon: const Icon(Icons.dark_mode),
            label: const Text("Toggle Theme"),
          ),
        ),
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
                  subtitle: Text('Track how long you’ve played: $stopwatchSec seconds'),
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
