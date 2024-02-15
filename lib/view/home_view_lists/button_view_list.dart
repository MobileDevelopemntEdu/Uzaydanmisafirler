import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {

  const Buttons({Key? key,});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () async {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade800,
                      onPrimary: Colors.white,
                    ),
                    child: const Text("Acil Durum"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    onPressed: () async {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade800,
                      onPrimary: Colors.white,
                    ),
                    child: const Text("Acil Durum"),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );

  }
}