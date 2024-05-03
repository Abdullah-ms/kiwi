import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedNotification;
  final void Function()? onPressedFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? myController;

  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedNotification,
    required this.onPressedSearch,
    this.onPressedFavorite,
    this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onPressedSearch,
                      icon: Icon(
                        Icons.search_outlined,
                        size: 35,
                        color: AppColors.blue,
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
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedNotification,
              icon: Icon(
                Icons.notifications_on_outlined,
                size: 30,
                color: AppColors.secondaryColor,
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
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: AppColors.secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
