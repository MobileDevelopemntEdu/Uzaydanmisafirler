import 'package:flutter/material.dart';
import 'register_view.dart';

class loginView extends StatelessWidget {
 loginView({super.key});


 final emailController = TextEditingController();
 final tcController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility,
                    size: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Kayıt Ol',
                    style: TextStyle(fontSize: 24.5),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              /*ClipOval(
            child: Container(
              width: 120.0,
              height: 120.0,
              color: Colors.blue, // You can replace this color with your image
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),*/

              /*const SizedBox(
               height: 25,
              ),
              const Center(child: Text("Register",style: TextStyle(fontSize:24.5 ),)),*/

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "e-mail",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: tcController,
                  decoration: InputDecoration(
                    hintText: "Tc-no",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print("Burada");

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: const Text("Giriş yap"),
                  ),
                ),
              ),

              TextButton(onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterView()));
                }, child: const Text("Register here"))
            ],
          ),
        ),
      ),
    );
  }
}
