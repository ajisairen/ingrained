import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingrained/src/services/post_service.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

XFile? _image;
var titleControl = TextEditingController();
var postControl = TextEditingController();

enum Tags { Plants, Gardening, Pricing, Other }

const List<(Tags, String)> tagging = <(Tags, String)>[
  (Tags.Plants, "Plants"),
  (Tags.Gardening, "Gardening"),
  (Tags.Pricing, "Pricing"),
  (Tags.Other, "Other"),
];

class _AddPostPageState extends State<AddPostPage> {
  final firestore = FirebaseFirestore.instance;
  final List<bool> _tagSelection =
      Tags.values.map((Tags x) => x == Tags.Other).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            titleControl.clear();
            postControl.clear();
            _image = null;
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          TextField(
            controller: titleControl,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 25.0,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter(RegExp('[A-Za-z0-9!?.,\$() ]'),
                  allow: true)
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          TextField(
            controller: postControl,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Post details",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 20.0,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Tags:  "),
            ToggleButtons(
              constraints: BoxConstraints(minWidth: 120, minHeight: 70),
              isSelected: _tagSelection,
              onPressed: (int index) {
                setState(() {
                  _tagSelection[index] = !_tagSelection[index];
                });
              },
              children:
                  tagging.map(((Tags, String) tag) => Text(tag.$2)).toList(),
            )
          ]),
          Padding(padding: EdgeInsets.only(top: 40)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                child: Center(
              child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: _image == null
                              ? Text('No image chosen...')
                              : Image.network(
                                  _image!.path,
                                  height: 300,
                                  width: 300,
                                  alignment: Alignment.center,
                                ),
                        ),
                      )
                    ],
                  )),
            )),
            SizedBox(
              width: 200,
              height: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green[100],
                  ),
                  onPressed: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        _image = image;
                      });
                    }
                  },
                  child: const Text('Select Image...')),
            )
          ]),
          Padding(padding: EdgeInsets.only(top: 40)),
          SizedBox(
              width: 200,
              height: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    if (titleControl.text.isNotEmpty &&
                        postControl.text.isNotEmpty) {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirmation"),
                                content: Text(
                                    "Are you sure you want to submit this post?"),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.green[20]),
                                    ),
                                    onPressed: () async {
                                      var imageName = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString();
                                      firestore.collection("TESTING").add({
                                        "date": DateTime.timestamp(),
                                        "id": DateTime.now()
                                                .millisecondsSinceEpoch %
                                            10123254,
                                        "imgUrl": imageName,
                                        "likes": 0,
                                        "profile": "GoldGiratina",
                                        "removed": false,
                                        "tags": ["Plants", "Other"],
                                        "text": postControl.text,
                                        "title": titleControl.text
                                      });
                                      Navigator.of(context).pop();
                                      titleControl.clear();
                                      postControl.clear();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error!"),
                              content: Text(
                                  "Please input a title and description of the post!"),
                              actions: [
                                TextButton(
                                    child: Text("OK",
                                        style:
                                            TextStyle(color: Colors.black26)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          });
                    }
                  },
                  child: Text("Submit Post"))),
        ],
      ),
    );
  }
}
