import 'package:flutter/material.dart';

Container searchField() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0),
      ],
    ),
    child: TextField(
      // controller: ,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search Pancake',
        hintStyle: const TextStyle(
          color: Color(0xffDDDADA),
          fontSize: 14,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Icons.search),
        ),
        suffixIcon: const SizedBox(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.1,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Ico,
                // ),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
