import 'package:Weather/core/helper/animatednavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Weather/features/presentation/manager/cubits/get_city_cubit/get_city_cubit.dart';
import 'package:Weather/features/presentation/widgets/search_field.dart';

import '../widgets/search_result_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CityCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            top: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              CustomAppBar(height: height),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 1),
                  child: SearchResultListTile(height: height, width: width),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  final double height;

  const CustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            animatednavigation(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color(0xFF469CE3), fontSize: 15),
          ),
        ),
        // Add some space between the back button and the search field
        Expanded(
          child: Container(
            height: widget.height * .06,
            width: double.infinity, // Expand to fill the available space
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const SerachField(),
          ),
        ),
        //By wrapping the SearchField widget in an Expanded widget,
        //  you're telling the Row to allocate all the available space to that widget,
        //  ensuring that it doesn't
        // overflow and allowing other widgets in the Row to occupy the remaining space.
      ],
    );
  }
}
