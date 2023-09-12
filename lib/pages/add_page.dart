import 'package:flutter/material.dart';
import 'package:notes/Database/database_services.dart';

class Add_page extends StatefulWidget {
  const Add_page({Key? key}) : super(key: key);

  @override
  State<Add_page> createState() => _Add_pageState();
}

class _Add_pageState extends State<Add_page> {
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
                      labelText: "Enter title",
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
                      labelText: "Enter detail",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      animationDuration: Duration(milliseconds: 20),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 40)),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        DatabaseServices.addData(titlec.text, detailc.text);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Successfully"),
                        duration: Duration(seconds: 5),
                      ));
                      titlec.clear();
                      detailc.clear();
                    },
                    child: Text("Add"),
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
