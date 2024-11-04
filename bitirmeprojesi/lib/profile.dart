import 'package:bitirmeprojesi/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final User? user;

  const EditProfilePage({super.key, required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _changePassword = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.user?.email);
    _nameController = TextEditingController(text: widget.user?.displayName);
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      // Profil güncelleme işlemleri
      if (_nameController.text != widget.user?.displayName) {
        await widget.user?.updateDisplayName(_nameController.text);
      }

      if (_emailController.text != widget.user?.email) {
        await widget.user?.updateEmail(_emailController.text);
      }

      // Şifre değiştirme işlemi
      if (_changePassword) {
        // Kullanıcının mevcut kimlik bilgilerini yeniden doğrulama
        AuthCredential credential = EmailAuthProvider.credential(
          email: widget.user?.email ?? '',
          password: _oldPasswordController.text,
        );

        await widget.user?.reauthenticateWithCredential(credential);
        await widget.user?.updatePassword(_newPasswordController.text);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil başarıyla güncellendi')),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Bir hata oluştu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      appBar: AppBar(
        title: const Text(
          'Profili Düzenle',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff343131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'E-posta',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'E-posta boş olamaz';
                    }
                    if (!value!.contains('@')) {
                      return 'Geçerli bir e-posta adresi girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Ad',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Ad boş olamaz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text(
                    'Şifreyi değiştir',
                    style: TextStyle(color: Colors.white70),
                  ),
                  value: _changePassword,
                  activeColor: Colors.yellow,
                  checkColor: Colors.black,
                  onChanged: (bool? value) {
                    setState(() {
                      _changePassword = value ?? false;
                    });
                  },
                ),
                if (_changePassword) ...[
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _oldPasswordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Mevcut Şifre',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    validator: (value) {
                      if (_changePassword && (value?.isEmpty ?? true)) {
                        return 'Mevcut şifre boş olamaz';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Yeni Şifre',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    validator: (value) {
                      if (_changePassword) {
                        if (value?.isEmpty ?? true) {
                          return 'Yeni şifre boş olamaz';
                        }
                        if (value!.length < 6) {
                          return 'Yeni şifre en az 6 karakter olmalıdır';
                        }
                        if (_newPasswordController.text !=
                            _confirmPasswordController.text) {
                          return 'Şifreler uyuşmuyor';
                        }
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
                      labelText: 'Yeni Şifre Tekrar',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                    ),
                    validator: (value) {
                      if (_changePassword) {
                        if (value?.isEmpty ?? true) {
                          return 'Yeni şifre tekrarı boş olamaz';
                        }
                        if (_newPasswordController.text !=
                            _confirmPasswordController.text) {
                          return 'Şifreler uyuşmuyor';
                        }
                      }
                      return null;
                    },
                  ),
                ],
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(350, 40),
                    backgroundColor: const Color(0xffDBD3D3),
                  ),
                  onPressed: _updateProfile,
                  child: const Text(
                    'Kaydet',
                    style: TextStyle(color: Colors.black),
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

class ProfilePage extends StatelessWidget {
  final User? user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343131),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(300, 0, 0, 70),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(user: user),
                        ),
                      );
                    },
                    child: const Icon(Icons.settings, color: Colors.white),
                  ),
                ),
                const CircleAvatar(
                  radius: 120,
                ),
                const SizedBox(height: 30),
                Text(
                  'Ad: ${user?.displayName ?? "Tanımsız"}',
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                Text(
                  'E-mail: ${user?.email ?? "Tanımsız"}',
                  style: const TextStyle(fontSize: 16, color: Colors.white60),
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(350, 40),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Çıkış Yap",
                    style: TextStyle(color: Colors.white),
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
