import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/manager/cubits/get_city_cubit/get_city_cubit.dart';

class SerachField extends StatelessWidget {
  const SerachField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      onChanged: (value) async {
        await BlocProvider.of<CityCubit>(context).getcity(cityname: value);
      },
      style: const TextStyle(
          color: Colors.white), // Set the color of the user input text
      decoration: decoration(),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(bottom: 12),
      hintText: "Search City",
      hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontSize: 14), // Hint text color
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.white,
        size: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
      filled: true,
      fillColor: const Color.fromARGB(255, 47, 46, 46),
    );
  }
}
