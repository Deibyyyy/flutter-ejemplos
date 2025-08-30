import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = "aplicación demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    CombinedExample(),
    ListTileExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.purple),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage("assets/img/logo.png"),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Text("menu principal"),
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text("AppBar Example"),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text("List View"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarExample extends StatelessWidget implements PreferredSizeWidget {
  const AppBarExample({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Proporciona un tamaño preferido

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      centerTitle: true,
      foregroundColor: Colors.white,
      title: const Text("AppBar Demo"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: "Show Snackbar",
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("this is a snackbar")));
          },
        ),
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: "Go to next page",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: const Text("Next page")),
                    body: const Center(
                      child: Text(
                        "This is the next page",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class BottonNavigationBarExample extends StatefulWidget {
  const BottonNavigationBarExample({super.key});

  @override
  State<BottonNavigationBarExample> createState() =>
      _BottonNavigationBarExampleState();
}

class _BottonNavigationBarExampleState
    extends State<BottonNavigationBarExample> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'schol'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CombinedExample extends StatelessWidget {
  const CombinedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarExample(),
        body: const BottonNavigationBarExample(),
      ),
    );
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  int _selectedIndex = 1;
  final List<String> programmingLanguages = [
    'Dart',
    'Python',
    'JavaScript',
    'Java',
    'C#',
    'C++',
    'Ruby',
    'Go',
    'Swift',
    'Kotlin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom List Item Sample')),
      body: ListView.builder(
        // +1 para agregar la card al final
        itemCount: programmingLanguages.length + 1,
        itemBuilder: (BuildContext context, int index) {
          // si estamos en el último índice -> mostramos la card
          if (index == programmingLanguages.length) {
            return const Padding(
              padding: EdgeInsets.all(12.0),
              child: CardExample(),
            );
          }

          // si no, mostramos los lenguajes
          return ListTile(
            leading: Icon(
              index == _selectedIndex
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
            ),
            title: Text(programmingLanguages[index]),
            selected: index == _selectedIndex,
            selectedTileColor: Colors.blue[100],
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("card sample")),
        body: const CardExample(),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://www.youtube.com/watch?v=W-AwQpWM4f0');

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 8),
            const Image(
              image: AssetImage('assets/img/dart-logo.png'),
              height: 120,
            ),
            const ListTile(
              leading: Icon(Icons.code, color: Colors.blue),
              title: Text('Dart lenguaje de programación'),
              subtitle: Text(
                "Dart es el lenguaje detrás de Flutter. "
                "Está optimizado para crear aplicaciones en múltiples plataformas, con un enfoque en la interfaz de usuario y la productividad..",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(onPressed: _launchUrl, child: const Text('LISTEN')),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
