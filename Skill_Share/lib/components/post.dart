// import 'package:flutter/material.dart';
// class Post extends StatelessWidget {
//   final String massage;
//   final String user;
//   const Post({
//     super.key,
//   required this.massage,
//   required this.user,
//   }
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           children: [
//             Text(user),
//             Text(massage),
//           ],
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String message;
  final String user;

  const Post({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(message),
          ],
        ),
      ),
    );
  }
}
