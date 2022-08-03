import 'package:flutter/material.dart';
import 'package:locals_test/models/response/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final convertedTimeStamp = convertPostDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 1.5),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(post.authorAvatarUrl),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: post.authorName,
                          style: const TextStyle(color: Color(0xFF690005)),
                          children: [
                        TextSpan(
                            text: '  @${post.authorName}',
                            style: const TextStyle(color: Colors.grey))
                      ])),
                  const SizedBox(height: 5),
                  Text(convertedTimeStamp)
                ],
              ),
              const Spacer(),
              const Icon(Icons.push_pin, color: Color(0xFF690005)),
              const SizedBox(width: 10)
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(post.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(post.text),
        ),
        const Divider(thickness: 1.5),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
          child: Row(
            children: const [
              Icon(
                Icons.thumb_up,
                color: Colors.grey,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '0',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }

  String convertPostDate() {
    final date = DateTime.fromMillisecondsSinceEpoch(post.timestamp * 1000);
    final year = date.toString().substring(0, 4);
    final month = date.toString().substring(5, 7);
    final day = date.toString().substring(8, 10);
    return '$month-$day-$year';
  }
}
