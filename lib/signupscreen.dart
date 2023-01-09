import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  //const signup({Key? key}) : super(key: key);
  FirebaseDatabase database = FirebaseDatabase.instance;
  @override
  State<signup> createState() => _signup();
}

class _signup extends State<signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DatabaseReference postListRef = FirebaseDatabase.instance.ref("posts");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),

          child: ListView(
              children: <Widget>[
           Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
                  child: const Text(
                   'Welcome Sign in',
              style: TextStyle(
             color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 20),
                  )),
               Container(
                 padding: const EdgeInsets.all(10),
                  child: TextField(
                   controller: nameController,
                   decoration: const InputDecoration(
                     border: OutlineInputBorder(),
                    labelText: 'Enter your Name',
             ),
            ),
           ),
              Container(
              padding: const EdgeInsets.all(10),
                 child: TextField(
                   controller: passwordController,
                     keyboardType: TextInputType.numberWithOptions(),
                       decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                 labelText: 'Enter your phoneNumber',
                    ),
                  ),
                 ),

             Container(
                   height: 50,
                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                   primary: Colors.blue,
                                      ),
                                child: const Text('Submit',
                                           style: TextStyle(color: Colors.white),
                      ),

                          onPressed: () async {
                            DatabaseReference newPostRef = postListRef.push();
                            await newPostRef.set({
                              "name": nameController.text,
                              "phoneNumber": passwordController.text,
                            });
                               final snackBar = SnackBar(
                              content: Text('Signed up successfully'),
                            );

                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                               //  text= nameController.text;
                               // code = idController.text;
                                    // _doSomething();

                          },
                    )
                      ),

                      ]
                      )),


    );
  }
}

