import 'package:distance_calculator/models/cordinates.dart';
import 'package:distance_calculator/models/message_model.dart';
import 'package:distance_calculator/models/result_model.dart';
import 'package:distance_calculator/service/api_service.dart';
import 'package:distance_calculator/widgets/textfields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MessageModel? message;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController userID = TextEditingController();

  Widget HBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  void postMessage() async {
    MessageModel messageModel = MessageModel(
      title: title.text.trim(),
      body: body.text.trim(),
      userID: int.parse(userID.text.trim()),
    );
    final apiMessage = ApiService.postMessage(messageModel);
    if (apiMessage != null) {
      message == apiMessage;
    }
  }

  void deleteMessage(int id) async {
    final status = await ApiService.deleteMessage(id);
    if (status) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Deleted'),
          backgroundColor: Colors.grey,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Xatolik yuz berdi."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding:
      //         const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      //     child: Column(
      //       children: [
      //         HBox(10),
      //         AppTextField(
      //           controller: title,
      //           title: 'Message title',
      //         ),
      //         HBox(10),
      //         AppTextField(
      //           controller: body,
      //           title: 'Message body',
      //         ),
      //         HBox(10),
      //         AppTextField(
      //           controller: userID,
      //           title: 'User ID',
      //         ),
      //         HBox(10),
      //
      //         HBox(30),
      //         ElevatedButton(
      //           onPressed: postMessage,
      //           child: const Text(
      //             'Post',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //         ),
      //         HBox(20),
      //         if (message != null)
      //           Center(
      //             child: Text(
      //               "${message!.id}",
      //               style: const TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.black,
      //               ),
      //             ),
      //           )
      //       ],
      //     ),
      //   ),
      // ),
      body: FutureBuilder(
        future: ApiService.getAllMessages(),
        builder: (context, builder) {
          if (builder.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (builder.hasError) {
            return Text(
              builder.error.toString(),
              style: const TextStyle(
                color: Colors.red,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: builder.data!.length,
              itemBuilder: (context, index) {
                final message = builder.data![index];
                return ListTile(
                  leading: const Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                  title: Text(message.title),
                  subtitle: Text(message.body),
                  trailing: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
