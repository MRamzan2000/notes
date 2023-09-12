import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/add_page.dart';

import '../Database/database_services.dart';
import 'update_data.dart';

class ShowDatapage extends StatelessWidget {
  const ShowDatapage({Key? key}) : super(key: key);

  navigation(BuildContext context, Widget next) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => next,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("NOTES APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          navigation(context, Add_page());
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder(
          stream: firebaseFirestore.collection("notes").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final res = snapshot.data!.docs[index];

                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (e) {
                    DatabaseServices.deleteData(res.id);
                  },
                  child: Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: ExpansionTile(
                      leading: IconButton(
                          onPressed: () {
                            navigation(
                                context,
                                EditPage(
                                  id: res.id,
                                  title: res["title"],
                                  detail: res["detail"],
                                ));
                          },
                          icon: Icon(Icons.edit)),
                      title: Text("${res["title"]}",
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("detail:${res["detail"]}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
