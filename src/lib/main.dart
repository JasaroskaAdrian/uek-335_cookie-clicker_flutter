import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


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
  int chocolateChipsLevel = 0;
  int bakingGlovesLevel = 0;
  int grandmasTouchLevel = 0;
  int grandsmasSecretRecipeLevel = 0;
  int sugarBoostLevel = 0;
  int magicWhiskLevel = 0;
  int autoMixerLevel = 0;
  int instaCookieMachineLevel = 0;

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
  _autoClickerTimer.cancel(); // Cancel existing timer if any

  double cookiesPerSecond =
      (cookieDoughLevel * 0.5) +
      (cookieOvenLevel * 1.5) +
      (chocolateChipsLevel * 5) +
      (bakingGlovesLevel * 10) +
      (grandmasTouchLevel * 25) +
      (grandsmasSecretRecipeLevel * 50) +
      (sugarBoostLevel * 100) +
      (magicWhiskLevel * 250) +
      (autoMixerLevel * 750) +
      (instaCookieMachineLevel * 2000);

  if (cookiesPerSecond > 0) {
    final duration = Duration(milliseconds: (1000 / cookiesPerSecond).round());

    _autoClickerTimer = Timer.periodic(duration, (timer) {
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
            child: Text('Buy for 150 🍪'),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.icecream),
          title: Text('Upgrade Chocolate Chips, Level: $chocolateChipsLevel'),
          subtitle: Text('Each Level increases cookies/sec by 5'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 450) {
                setState(() {
                  _cookieCounter -= 450;
                  chocolateChipsLevel++;
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
          leading: Icon(Icons.back_hand),
          title: Text('Upgrade Baking Gloves, Level: $bakingGlovesLevel'),
          subtitle: Text('Each Level increases cookies/sec by 10'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 1350) {
                setState(() {
                  _cookieCounter -= 1350;
                  bakingGlovesLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 1'350 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.elderly_woman),
          title: Text('Upgrade Grandmas Touch, Level: $grandmasTouchLevel'),
          subtitle: Text('Each Level increases cookies/sec by 25'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 4050) {
                setState(() {
                  _cookieCounter -= 4050;
                  grandmasTouchLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 4'050 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.menu_book),
          title: Text('Upgrade Grandmas Secret Recipe, Level: $grandsmasSecretRecipeLevel'),
          subtitle: Text('Each Level increases cookies/sec by 50'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 12150) {
                setState(() {
                  _cookieCounter -= 12150;
                  grandsmasSecretRecipeLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 12'150 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.bolt),
          title: Text('Upgrade Sugar Boost, Level: $sugarBoostLevel'),
          subtitle: Text('Each Level increases cookies/sec by 100'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 36450) {
                setState(() {
                  _cookieCounter -= 36450;
                  sugarBoostLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 36'450 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.auto_fix_high),
          title: Text('Upgrade Magic Whisk, Level: $magicWhiskLevel'),
          subtitle: Text('Each Level increases cookies/sec by 250'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 109350) {
                setState(() {
                  _cookieCounter -= 109350;
                  magicWhiskLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 109'350 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.blender),
          title: Text('Upgrade Auto Mixer, Level: $autoMixerLevel'),
          subtitle: Text('Each Level increases cookies/sec by 750'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 328050) {
                setState(() {
                  _cookieCounter -= 328050;
                  autoMixerLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 328'050 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.factory),
          title: Text('Upgrade INSTA COOKIE MACHINERY, Level: $instaCookieMachineLevel'),
          subtitle: Text('Each Level increases cookies/sec by 2000'),
          trailing: ElevatedButton(
            onPressed: () {
              if (_cookieCounter >= 984150) {
                setState(() {
                  _cookieCounter -= 984150;
                  instaCookieMachineLevel++;
                  startAutoClicker();
                });
              }
            },
            child: Text("Buy for 984'150 🍪"),
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
