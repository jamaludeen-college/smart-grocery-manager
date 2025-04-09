import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController controller;

  final void Function(String)? onSubmitted;

  const CustomAppBar({super.key, required this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.teal,
      child: Column(
        children: [
          const SizedBox(height: 32), // for status bar
          SizedBox(
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Grocery List',
                        items: const [
                          DropdownMenuItem(
                            value: 'Grocery List',
                            child: Text('Grocery List'),
                          ),
                        ],
                        onChanged: (value) {},
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'Add item',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.history),
                    SizedBox(width: 8),
                    Icon(Icons.mic),
                    SizedBox(width: 8),
                    Icon(Icons.qr_code),
                    SizedBox(width: 8),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
