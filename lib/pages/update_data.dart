import 'package:flutter/material.dart';

import '../Database/database_services.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {
  String? id;
  String? title;
  String? detail;

  EditPage({super.key, this.id, this.detail, this.title});

  TextEditingController titlec = TextEditingController();

  TextEditingController detailc = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("NOTES APP"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter title";
                      } else {
                        return null;
                      }
                    },
                    controller: titlec,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "${title ?? ''}", // Use ${title ?? ''}
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter detail";
                      } else {
                        return null;
                      }
                    },
                    maxLines: 10,
                    controller: detailc,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "${detail ?? ''}", // Use ${detail ?? ''}
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      animationDuration: Duration(milliseconds: 20),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      minimumSize: MaterialStateProperty.all(
                        Size(double.infinity, 40),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        DatabaseServices.updateData(
                            id!, titlec.text, detailc.text);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Successfully"),
                        duration: Duration(seconds: 5),
                      ));
                    },
                    child: Text("UPDATE"),
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
