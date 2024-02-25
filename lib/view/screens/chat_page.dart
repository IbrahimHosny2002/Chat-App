import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message_mode.dart';
import 'package:chat_app/view/screens/login_page.dart';
import 'package:chat_app/view/widgets/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = "chatpage";

  @override
  Widget build(BuildContext context) {
    String? content;
    var userName = ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages =
        FirebaseFirestore.instance.collection(kMessagesCollection);
    TextEditingController controller = TextEditingController();
    ScrollController listController = ScrollController();
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  
                  actions:[ IconButton(
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacementNamed(LoginPage.id);
                    }, 
                    icon: const Icon(Icons.login_rounded,color: Colors.white),
                    ),],
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 50,
                      ),
                      const Text(
                        'Chat',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: listController,
                          itemBuilder: (context, index) {
                            return messageList[index].id == userName
                                ? ChatBubble(
                                    messageModel: messageList[index],
                                  )
                                : ChatBubbleForFriend(
                                    messageModel: messageList[index]);
                          },
                          itemCount: messageList.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onChanged: (data) {
                          content = data;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              messages.add({
                                kMessage: content,
                                kCreatedAt: DateTime.now(),
                                'id': userName,
                              });
                              controller.clear();
                              listController.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                          ),
                          hintText: 'Send Message',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                    ),
                  ],
                ));
          } else {
            return const Scaffold(
              body: Center(
                child: Text('There is an error'),
              ),
            );
          }
        });
  }
}
