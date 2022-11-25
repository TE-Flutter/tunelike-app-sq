import 'package:flutter/material.dart';
import 'package:tunelike/domain/repository/user_repository.dart';

class PostComponent extends StatefulWidget {
  const PostComponent(
      {super.key,
      this.title,
      this.content,
      this.imageUrl,
      this.imageThumbUrl,
      this.allowComment = true,
      this.author});

  final String? title;
  final String? content;
  final String? imageUrl;
  final String? imageThumbUrl;
  final bool allowComment;
  final TuneLikeUser? author;

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  void initPost() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      child: Column(children: [
        //Author details section
        SizedBox(
          height: 40,
          child: Row(children: const []),
        )
      ]),
    );
  }
}
