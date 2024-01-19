import 'package:flutter/material.dart';

class FavoriteToggleIcon extends StatefulWidget {
  final Function(bool) onFavoriteChanged;

  const FavoriteToggleIcon({required this.onFavoriteChanged});

  @override
  _FavoriteToggleIconState createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          favorite = !favorite;
          widget.onFavoriteChanged(favorite);
        });
      },
      child: Icon(
        favorite ? Icons.favorite : Icons.favorite_border,
        color: favorite ? Colors.red : Colors.blueGrey,
        size: 30,
      ),
    );
  }
}
