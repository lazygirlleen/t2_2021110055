import 'package:flutter/material.dart'; 
import 'package:t2_2021110055/models/account.dart';
import 'package:provider/provider.dart';
import 'package:t2_2021110055/provider/account_provider.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    final existingAccount =
        ModalRoute.of(context)!.settings.arguments as Account?;
    final isEdit = existingAccount != null;

    if (isEdit) {
      nameController.text = existingAccount.name;
      emailController.text = existingAccount.email;
      phoneController.text = existingAccount.phone;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Account' : 'Add Account'),
        actions: [
          // Menambahkan avatar ke AppBar untuk navigasi ke MainScreen
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/mainScreen');
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'), // Gambar avatar
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final email = emailController.text;
                final phone = phoneController.text;

                final newAccount = Account(
                  id: isEdit
                      ? existingAccount.id
                      : DateTime.now().millisecondsSinceEpoch,
                  name: name,
                  email: email,
                  phone: phone,
                );

                if (isEdit) {
                  context.read<AccountProvider>().editAccount(newAccount);
                } else {
                  context.read<AccountProvider>().addAccount(newAccount);
                }

                // Mengganti halaman ke MainScreen setelah data disimpan
                Navigator.pushReplacementNamed(context, '/mainScreen');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
