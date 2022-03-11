import 'package:contatos/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://play-lh.googleusercontent.com/2cuaXC_ci1cv2EVNUHNOwJpV1ci83Lz8PpfEgtR1CMS93q27qqXSKdiw8TD5k-G8wHs=s128-rw",
              width: 500,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListaContatos()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: 150,
                height: 100,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people),
                    Text("Contatos"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
