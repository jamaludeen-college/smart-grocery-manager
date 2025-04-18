import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  final String selectedList;
  final List<String> listOptions;
  final ValueChanged<String?>? onListChanged;
  final VoidCallback? onMicPressed;
  final bool isListening;

  const CustomAppBar({
    super.key,
    required this.controller,
    this.onSubmitted,
    required this.selectedList,
    required this.listOptions,
    required this.onListChanged,
    this.onMicPressed,
    required this.isListening,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.teal,
      child: Column(
        children: [
          const SizedBox(height: 32), // Status bar space
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
                        value: selectedList,
                        items:
                            listOptions
                                .map(
                                  (list) => DropdownMenuItem(
                                    value: list,
                                    child: Text(
                                      list,
                                      style: const TextStyle(
                                        color:
                                            Colors
                                                .black, // 👈 Dropdown item color
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged:
                            (String? value) => onListChanged?.call(value),
                        dropdownColor:
                            Colors.white, // 👈 Dropdown background color
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color:
                              Colors
                                  .white, // 👈 Dropdown icon color (visible on teal)
                        ),
                        underline: Container(), // 👈 Remove default underline
                        style: const TextStyle(
                          color:
                              Colors.white, // 👈 Selected value shown on teal
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
                  children: [
                    IconButton(
                      icon: const Icon(Icons.history),
                      onPressed: () {}, // You can hook this later if needed
                    ),
                    IconButton(
                      onPressed: onMicPressed,
                      icon: Icon(
                        isListening ? Icons.mic : Icons.mic_none,
                        color: isListening ? Colors.red : Colors.grey,
                      ),
                    ),

                    IconButton(
                      icon: const Icon(Icons.qr_code),
                      onPressed: () {}, // Optional
                    ),
                    const SizedBox(width: 8),
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
