import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({Key? key,});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "hastane ara",
                        hintStyle: TextStyle(
                          color:  Theme.of(context).colorScheme.onPrimary,
                        ),
                        filled: true,
                        prefixIcon: Icon(Icons.search,color: theme.onPrimary,),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  child: IconButton(
                    icon: Icon(Icons.person,),
                    color: Theme.of(context).colorScheme.background,
                    onPressed: () {
                      // will change later to go to the profile page
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}