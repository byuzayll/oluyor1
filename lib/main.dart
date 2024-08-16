import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KUTSO",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KUTSO"),
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/kutso.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    backgroundColor: Colors.black45,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: const Text('GİRİŞ YAP'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('DUYURULAR'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DuyurularEkrani()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('İLETİŞİM'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/kutso-kariyer-banner-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: <Widget>[
                buildMenuItem(context, 'Giriş yap', Icons.login, const Login()),
                buildMenuItem(
                    context, 'Haberler', Icons.article, const Placeholder()),
                buildMenuItem(context, 'Duyurular', Icons.announcement,
                    const DuyurularEkrani()),
                buildMenuItem(context, 'Yönetim Kurulu', Icons.group,
                    const Placeholder()),
                buildMenuItem(context, 'Meclis Üyeleri', Icons.people,
                    const Placeholder()),
                buildMenuItem(context, 'Kadın Girişimciler', Icons.female,
                    const Placeholder()),
                buildMenuItem(context, 'Genç Girişimciler', Icons.school,
                    const Placeholder()),
                buildMenuItem(
                    context, 'Ayarlar', Icons.settings, const Placeholder()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, String title, IconData icon, Widget screen) {
    return Card(
      color: const Color.fromRGBO(
          248, 244, 202, 1), // Background color: C:8 M:11 Y:64 K:0
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,
                size: 40.0,
                color: const Color.fromRGBO(
                    81, 67, 55, 1)), // Icon color: C:81 M:67 Y:55 K:83
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(
                    81, 67, 55, 1), // Text color: C:81 M:67 Y:55 K:83
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        backgroundColor:
            const Color.fromRGBO(178, 136, 0, 1), // C:0 M:26 Y:100 K:31
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'KUTSO Üye Girişi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(40, 35, 27, 1), // C:81 M:67 Y:55 K:83
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: const Color.fromRGBO(
                      248, 244, 202, 1), // C:8 M:11 Y:64 K:0
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'TC Kimlik Numarası',
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(
                                  40, 35, 27, 1), // C:81 M:67 Y:55 K:83
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.person,
                                color: Color.fromRGBO(40, 35, 27, 1)),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Şifre',
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(
                                  40, 35, 27, 1), // C:81 M:67 Y:55 K:83
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color.fromRGBO(40, 35, 27, 1)),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility,
                                  color: Color.fromRGBO(40, 35, 27, 1)),
                              onPressed: () {
                                // Toggle password visibility
                              },
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Giriş işlemi burada gerçekleştirilebilir
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(
                                178, 136, 0, 1), // C:0 M:26 Y:100 K:31
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text(
                            'Giriş Yap',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(
                                  217, 217, 214, 1), // C:14 M:10 Y:8 K:0
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // Şifremi unuttum işlemi
                          },
                          child: const Text(
                            'Şifremi Unuttum?',
                            style: TextStyle(
                              color: Color.fromRGBO(
                                  40, 35, 27, 1), // C:81 M:67 Y:55 K:83
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DuyurularEkrani extends StatelessWidget {
  const DuyurularEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duyurular'),
        backgroundColor:
            const Color.fromRGBO(178, 136, 0, 1), // C:0 M:26 Y:100 K:31
      ),
      body: Container(
        color: const Color.fromRGBO(248, 244, 202, 1), // C:8 M:11 Y:64 K:0
        child: const Center(
          child: Text(
            'Duyurular sayfası',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(40, 35, 27, 1), // C:81 M:67 Y:55 K:83
            ),
          ),
        ),
      ),
    );
  }
}
