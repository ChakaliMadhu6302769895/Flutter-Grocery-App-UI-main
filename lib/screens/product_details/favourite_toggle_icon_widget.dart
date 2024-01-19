import 'package:flutter/material.dart';

class FavoriteToggleIcon extends StatefulWidget {
  final ValueChanged<bool> onFavoriteChanged;
  final bool initialFavorite;

  const FavoriteToggleIcon({
    required this.onFavoriteChanged,
    this.initialFavorite = false,
  });

  @override
  _FavoriteToggleIconState createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<FavoriteToggleIcon> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        widget.onFavoriteChanged(isFavorite);
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.blueGrey,
        size: 30,
      ),
    );
  }
}
