import 'package:flutter/material.dart';

String name = '', sap = '', email = '', password = '';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var o = MediaQuery.of(context).orientation;
return Scaffold(
body: Center(
child: o == Orientation.portrait
 ? Column(
 mainAxisAlignment: MainAxisAlignment.center,
children: buttons(context),
 )
 : Row(
mainAxisAlignment: MainAxisAlignment.center,
children: buttons(context),
 ),
      ),
    );
  }

 List<Widget> buttons(BuildContext c) => [
 const Text('Welcome', style: TextStyle(fontSize: 30)),
ElevatedButton(
 onPressed: () => Navigator.push(
 c,
MaterialPageRoute(builder: (_) => const SignupPage()),
),
 child: const Text('Sign Up'),
 ),
 ElevatedButton(
 onPressed: () => Navigator.push(
 c,
  MaterialPageRoute(builder: (_) => const LoginPage()),
   ),
   child: const Text('Login'),
    ),
  ];
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var o = MediaQuery.of(context).orientation;

 return Scaffold(
 appBar: AppBar(title: const Text('Sign Up')),
 body: Form(
  key: key,
  child: Padding(
  padding: const EdgeInsets.all(20),
  child: o == Orientation.portrait
  ? Column(children: fields())
   : Row(children: fields()),
  ),
 ),
    );
  }

  List<Widget> fields() => [
 Expanded(
 child: TextFormField(
  decoration: const InputDecoration(labelText: 'Full Name'),
   validator: (v) => v!.isEmpty ? 'Required' : null,
onSaved: (v) => name = v!,
      ),
    ),
    Expanded(
child: TextFormField(
decoration: const InputDecoration(labelText: 'SAP ID'),
 keyboardType: TextInputType.number,
validator: (v) => v!.isEmpty
 ? 'Required'
   : int.tryParse(v) == null
  ? 'Numbers only'
            : null,
        onSaved: (v) => sap = v!,
      ),
    ),
    Expanded(
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        validator: (v) => v!.isEmpty
  ? 'Required'
  : !v.contains('@')
   ? 'Invalid email'
   : null,
        onSaved: (v) => email = v!,
      ),
    ),
    Expanded(
      child: TextFormField(
 obscureText: true,
 decoration: const InputDecoration(labelText: 'Password'),
 validator: (v) => v!.isEmpty
    ? 'Required'
 : v.length < 6
  ? 'Minimum 6 characters'
   : null,
        onSaved: (v) => password = v!,
      ),
    ),
    ElevatedButton(
      onPressed: () {
        if (key.currentState!.validate()) {
          key.currentState!.save();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          );
        }
      },
      child: const Text('Sign Up'),
    ),
  ];
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  String e = '', p = '';

  @override
  Widget build(BuildContext context) {
    var o = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: o == Orientation.portrait
              ? Column(children: fields())
              : Row(children: fields()),
        ),
      ),
    );
  }

  List<Widget> fields() => [
    Expanded(
      child: TextFormField(
        decoration: const InputDecoration(labelText: 'Email'),
        validator: (v) => v!.isEmpty
            ? 'Required'
            : !v.contains('@')
            ? 'Invalid email'
            : null,
        onSaved: (v) => e = v!,
      ),
    ),
    Expanded(
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(labelText: 'Password'),
        validator: (v) => v!.isEmpty ? 'Required' : null,
        onSaved: (v) => p = v!,
      ),
    ),
    ElevatedButton(
      onPressed: () {
  if (key.currentState!.validate()) {
  key.currentState!.save();

 if (e == email && p == password) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          } else {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Wrong email or password'),
    ),
    );
 }
  }
      },
      child: const Text('Login'),
    ),
  ];
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var o = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
   child: SingleChildScrollView(
      child: Container(
    width: o == Orientation.portrait ? 350 : 600,
        padding: const EdgeInsets.all(25),
   child: Column(
                children: [
     CircleAvatar(
     radius: 70,
    backgroundImage:
    AssetImage('images/profilepic.png'),
       ),
          const SizedBox(height: 20),
          const Text(
    'Muhammad Muneeb Manzoor',
    textAlign: TextAlign.center,
    style: TextStyle(
     fontSize: 24,
         fontWeight: FontWeight.bold,
  ),
  ),
   const SizedBox(height: 10),
    const Text(
  'Software Engineering Student',
    textAlign: TextAlign.center,
       style: TextStyle(fontSize: 18),
     ),
        const SizedBox(height: 10),
        const Text(
        'Riphah International University',
     textAlign: TextAlign.center,
     style: TextStyle(fontSize: 16),
   ),
  const SizedBox(height: 10),
    const Text(
     'Semester 5',
    textAlign: TextAlign.center,
 style: TextStyle(fontSize: 16),
  ),
  const SizedBox(height: 20),
  Container(
    width: double.infinity,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Text(
      'Skills: Flutter, Web Development, Python',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
                    ),
  ), const SizedBox(height: 20), const Text(
                    'I am a Software Engineering student interested in Flutter, '
                        'Web Development, and Python. I enjoy creating simple and '
                        'useful applications and learning new technologies.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
     ),
                ],
   ),
      ),
   ),
        ),
      ),
    );
  }
}