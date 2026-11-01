// import 'package:flutter/material.dart';
// import 'package:skill_share/components/my_drawer.dart';
// import 'package:skill_share/components/my_text_field.dart';
// import 'package:skill_share/components/post.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'auth/auth_gate.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
//   final supabase = Supabase.instance.client;
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//
//     final currentUser = Supabase.instance.client.auth.currentUser;
//     final textController= TextEditingController();
//
//     void postMassage(){
//       if(textController.text.isNotEmpty){
//         Supabase.instance.client.from("posts").add({
//           "user_email":currentUser.email,
//           "massage":textController.text,
//           "TimeStamp":TimeStamp.now(),
//         });
//       }
//     }
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text("SKILL SHARE"),
//         backgroundColor: Colors.grey[900],
//       ),
//
//       drawer:MyDrawer(),
//
//       body: Center(
//         child: Column(
//           children: [
//
//             Expanded(
//               child: StreamBuilder(
//                 stream: Supabase.instance.client
//                     .from("posts").stream(primaryKey:['id']),
//                     .order("created_at",acending:true,),
//
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         final post = snapshot.data!.docs[index];
//
//                         return Post(massage: Post["massage"]?? '', user: Post["user_email"]?? '');
//                       },
//                     );
//                   }else if(snapshot.hasError){
//                     return Center(child: Text("Error: "+ snapshot.error.toString()),
//                     );
//                   }
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MyTextField(
//                       controller: textController,
//                       hintText: "write something...",
//                       obscureText:false,
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: postMassage,
//                       icon: Icon(Icons.arrow_circle_up)
//                   ),
//                 ],
//               ),
//
//             ),
//             Text("Logged in as: "+ currentUser!.email!),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:skill_share/components/my_drawer.dart';
import 'package:skill_share/components/my_text_field.dart';
import 'package:skill_share/components/post.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;

  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<void> postMessage() async {
    final currentUser = supabase.auth.currentUser;

    if (textController.text.trim().isEmpty) {
      return;
    }

    if (currentUser == null) {
      return;
    }

    try {
      await supabase.from("posts").insert({
        "user_email": currentUser.email,
        "message": textController.text.trim(),
        "created_at": DateTime.now().toIso8601String(),
      });

      textController.clear();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = supabase.auth.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        title: const Text("SKILL SHARE"),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      drawer: MyDrawer(),

      body: Column(
        children: [

          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: supabase
                  .from("posts")
                  .stream(primaryKey: ['id'])
                  .order("created_at", ascending: true),

              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                    ),
                  );
                }

                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final posts = snapshot.data ?? [];

                if (posts.isEmpty) {
                  return const Center(
                    child: Text("No posts yet"),
                  );
                }

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    return Post(
                      message: post["message"] ?? "",
                      user: post["user_email"] ?? "",
                    );
                  },
                );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: textController,
                    hintText: "Write something...",
                    obscureText: false,
                  ),
                ),

                IconButton(
                  onPressed: postMessage,
                  icon: const Icon(
                    Icons.arrow_circle_up,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "Logged in as: ${currentUser?.email ?? "No user"}",
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
