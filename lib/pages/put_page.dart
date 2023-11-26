import 'package:distance_calculator/models/message_model.dart';
import 'package:flutter/material.dart';

import '../widgets/textfields.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key});

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  void putMessage() {
    MessageModel messageModel = MessageModel(
      title: title.text.trim(),
      body: body.text.trim(),
      userID: int.parse(
        userID.text.trim(),
      ),
      id: int.parse(
        id.text.trim(),
      ),
    );
  }

  MessageModel? messageModel;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController userID = TextEditingController();
  TextEditingController id = TextEditingController();

  Widget HBox(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              HBox(10),
              AppTextField(
                controller: title,
                title: 'Message title',
              ),
              HBox(10),
              AppTextField(
                controller: body,
                title: 'Message body',
              ),
              HBox(10),
              AppTextField(controller: id, title: 'Message ID'),
              HBox(10),
              AppTextField(
                controller: userID,
                title: 'User ID',
              ),
              HBox(10),
              HBox(30),
              ElevatedButton(
                onPressed: putMessage,
                child: const Text(
                  'Post',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              HBox(20),
              if (messageModel != null)
                Center(
                  child: Text(
                    "${messageModel!.title}\n${messageModel!.body}\n${messageModel!.id}\n${messageModel!.userID}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
