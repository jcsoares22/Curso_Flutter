import 'dart:io';

import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;
  static const _defaultImage = 'assets/images/avatar.png';
  const MessageBubble({
    required this.message,
    required this.belongsToCurrentUser,
    super.key,
  });

  Widget _showUserImage(String imageURl) {
    ImageProvider? provider;
    final uri = Uri.parse(imageURl);
    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    belongsToCurrentUser ? Colors.grey.shade300 : Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: belongsToCurrentUser
                      ? Radius.circular(12)
                      : Radius.circular(0),
                  bottomRight: belongsToCurrentUser
                      ? Radius.circular(0)
                      : Radius.circular(12),
                ),
              ),
              width: 180,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: belongsToCurrentUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message.text,
                    textAlign:
                        belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                      color: belongsToCurrentUser ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 0,
            left: belongsToCurrentUser ? null : 165,
            right: belongsToCurrentUser ? 165 : null,
            child: _showUserImage(message.userImageUrl)),
      ],
    );
  }
}
//453561,