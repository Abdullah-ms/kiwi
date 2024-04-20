import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;

  const CustomAppBar(
      {super.key,
      required this.titleAppBar,
      required this.onPressedNotification,
      required this.onPressedSearch,
      required this.onPressedFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onPressedSearch,
                      icon: const Icon(
                        Icons.search_outlined,
                        size: 35,
                      )),
                  hintText: titleAppBar,
                  hintStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  fillColor: Colors.grey[200],
                  filled: true),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedNotification,
              icon: const Icon(
                Icons.notifications_on_outlined,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
