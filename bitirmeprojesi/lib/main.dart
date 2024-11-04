import 'package:bitirmeprojesi/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bitirmeprojesi/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> emailSignIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Kullanıcı giriş başarılı
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: userCredential.user),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = _handleAuthErrors(e);
      showSnackBar(message);
    }
  }

  String _handleAuthErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "Bu e-posta adresine ait bir hesap bulunamadı. Lütfen kayıt olun.";
      case 'wrong-password':
        return "Girmiş olduğunuz şifre yanlış. Şifrenizi unutmuşsanız, 'Şifremi Unuttum' kısmından şifre sıfırlama işlemi yapabilirsiniz.";
      case 'invalid-email':
        return "Geçersiz e-posta adresi formatı. Lütfen doğru bir e-posta adresi girin.";
      case 'user-disabled':
        return "Bu hesap devre dışı bırakılmış. Destek ekibiyle iletişime geçin.";
      case 'too-many-requests':
        return "Çok fazla giriş denemesi yaptınız. Lütfen daha sonra tekrar deneyin veya şifrenizi sıfırlayın.";
      case 'operation-not-allowed':
        return "Bu giriş yöntemi devre dışı bırakılmış. Lütfen başka bir giriş yöntemi deneyin.";
      default:
        return "Bir hata oluştu. Lütfen tekrar deneyin veya destek ekibiyle iletişime geçin.";
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        backgroundColor: const Color(0xff343131),
        automaticallyImplyLeading: false,
        title: const Text(
          "Giriş Ekranı",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Giriş Yap",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "E-Posta",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xff4A4A4A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xff4A4A4A),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(350, 40),
                  backgroundColor: const Color(0xffDBD3D3),
                ),
                onPressed: emailSignIn,
                child: const Text("Giriş Yap"),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(350, 40),
                  backgroundColor: const Color(0xffDBD3D3),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text("Kayıt Ol"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool termsAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String firstName = '';
  String lastName = '';

  Future<void> emailSignUp() async {
    if (!_formKey.currentState!.validate() || !termsAccepted) return;

    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(user: userCredential.user)),
      );
    } on FirebaseAuthException catch (e) {
      String message = _handleRegisterErrors(e);
      showSnackBar(message);
    }
  }

  String _handleRegisterErrors(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "Bu e-posta adresi zaten kullanımda. Lütfen başka bir e-posta adresi deneyin.";
      case 'invalid-email':
        return "Geçersiz e-posta adresi formatı. Lütfen doğru bir e-posta adresi girin.";
      case 'weak-password':
        return "Şifre çok zayıf. En az 6 karakter içeren bir şifre seçin.";
      case 'operation-not-allowed':
        return "Bu kayıt yöntemi devre dışı bırakılmış. Lütfen başka bir yöntem deneyin.";
      default:
        return "Bir hata oluştu. Lütfen tekrar deneyin veya destek ekibiyle iletişime geçin.";
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
        backgroundColor: const Color(0xff343131),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Kayıt Ol",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Ad",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff4A4A4A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ad boş olamaz';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    firstName = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Soyad",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff4A4A4A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Soyad boş olamaz';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    lastName = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "E-Posta",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff4A4A4A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'E-posta boş olamaz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff4A4A4A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Şifre boş olamaz';
                    } else if (value.length < 6) {
                      return 'Şifre en az 6 karakter olmalıdır';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Şifreyi Onayla",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xff4A4A4A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Şifreyi onaylayın';
                    } else if (value != _passwordController.text) {
                      return 'Şifreler eşleşmiyor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(
                      value: termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          termsAccepted = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "Hizmet Şartlarını Kabul Ediyorum",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(350, 40),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: emailSignUp,
                  child: const Text("Kayıt Ol"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
