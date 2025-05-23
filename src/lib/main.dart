import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp]);
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
  Timer _autoSaveTimer = Timer(Duration.zero, () {});

  Future<void> saveGameData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('cookieCounter', _cookieCounter);
  prefs.setInt('totalCookiesCollected', _totalCookiesCollected);
  prefs.setInt('cookieDoughLevel', cookieDoughLevel);
  prefs.setInt('cookieOvenLevel', cookieOvenLevel);
  prefs.setInt('chocolateChipsLevel', chocolateChipsLevel);
  prefs.setInt('bakingGlovesLevel', bakingGlovesLevel);
  prefs.setInt('grandmasTouchLevel', grandmasTouchLevel);
  prefs.setInt('grandsmasSecretRecipeLevel', grandsmasSecretRecipeLevel);
  prefs.setInt('sugarBoostLevel', sugarBoostLevel);
  prefs.setInt('magicWhiskLevel', magicWhiskLevel);
  prefs.setInt('autoMixerLevel', autoMixerLevel);
  prefs.setInt('instaCookieMachineLevel', instaCookieMachineLevel);
}

Future<void> loadGameData() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _cookieCounter = prefs.getInt('cookieCounter') ?? 0;
    _totalCookiesCollected = prefs.getInt('totalCookiesCollected') ?? 0;
    cookieDoughLevel = prefs.getInt('cookieDoughLevel') ?? 0;
    cookieOvenLevel = prefs.getInt('cookieOvenLevel') ?? 0;
    chocolateChipsLevel = prefs.getInt('chocolateChipsLevel') ?? 0;
    bakingGlovesLevel = prefs.getInt('bakingGlovesLevel') ?? 0;
    grandmasTouchLevel = prefs.getInt('grandmasTouchLevel') ?? 0;
    grandsmasSecretRecipeLevel = prefs.getInt('grandsmasSecretRecipeLevel') ?? 0;
    sugarBoostLevel = prefs.getInt('sugarBoostLevel') ?? 0;
    magicWhiskLevel = prefs.getInt('magicWhiskLevel') ?? 0;
    autoMixerLevel = prefs.getInt('autoMixerLevel') ?? 0;
    instaCookieMachineLevel = prefs.getInt('instaCookieMachineLevel') ?? 0;
  });
  startAutoClicker(); // Start the auto clicker that adds souls every second
}
Future<void> purgeData() async {
  final prefs = await SharedPreferences.getInstance();

  // Remove all relevant saved keys
  await prefs.remove('cookieCounter');
  await prefs.remove('totalCookiesCollected');
  await prefs.remove('cookieDoughLevel');
  await prefs.remove('cookieOvenLevel');
  await prefs.remove('chocolateChipsLevel');
  await prefs.remove('bakingGlovesLevel');
  await prefs.remove('grandmasTouchLevel');
  await prefs.remove('grandsmasSecretRecipeLevel');
  await prefs.remove('sugarBoostLevel');
  await prefs.remove('magicWhiskLevel');
  await prefs.remove('autoMixerLevel');
  await prefs.remove('instaCookieMachineLevel');

  // Reset your in-memory variables and update UI
  setState(() {
    _cookieCounter = 0;
    _totalCookiesCollected = 0;
    cookieDoughLevel = 0;
    cookieOvenLevel = 0;
    chocolateChipsLevel = 0;
    bakingGlovesLevel = 0;
    grandmasTouchLevel = 0;
    grandsmasSecretRecipeLevel = 0;
    sugarBoostLevel = 0;
    magicWhiskLevel = 0;
    autoMixerLevel = 0;
    instaCookieMachineLevel = 0;
    _autoClickerTimer.cancel();
  });
}


@override
void initState() {
  super.initState();
  loadGameData(); // Load saved game data when the app starts

  // Start auto-saving every 5 seconds
  _autoSaveTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    saveGameData();
  });
}


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
            onPressed: _cookieCounter >= 50 ? () {
                setState(() {
                  _cookieCounter -= 50;
                  cookieDoughLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 150 ? () {
              
                setState(() {
                  _cookieCounter -= 150;
                  cookieOvenLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 450 ? () {
              
                setState(() {
                  _cookieCounter -= 450;
                  chocolateChipsLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 1350 ? () {
              
                setState(() {
                  _cookieCounter -= 1350;
                  bakingGlovesLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 4050 ? () {
                setState(() {
                  _cookieCounter -= 4050;
                  grandmasTouchLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 12150 ? () {
              
                setState(() {
                  _cookieCounter -= 12150;
                  grandsmasSecretRecipeLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 36450 ? () {
                setState(() {
                  _cookieCounter -= 36450;
                  sugarBoostLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 109350 ? () {
                setState(() {
                  _cookieCounter -= 109350;
                  magicWhiskLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 328050 ? () {
             
                setState(() {
                  _cookieCounter -= 328050;
                  autoMixerLevel++;
                  startAutoClicker();
                });
              }: null,
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
            onPressed: _cookieCounter >= 984150 ? () {
                setState(() {
                  _cookieCounter -= 984150;
                  instaCookieMachineLevel++;
                  startAutoClicker();
                  
                });
              }: null,
            child: Text("Buy for 984'150 🍪"),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.delete),
          title: Text('PURGE THE COOKIES'),
          subtitle: Text('Reset your whole Game by purging your saved Data'),
          trailing: ElevatedButton(
            onPressed: () {
              purgeData();
            },
            child: Text(" DELETE "),
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
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.store),
            selectedIcon: Icon(Icons.store_outlined),
            label: 'Shop Upgrades',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_sharp),
            selectedIcon: Icon(Icons.account_circle_outlined),
            label: 'Stats',
          ),
        ],
      ),
    );
    
  }
}