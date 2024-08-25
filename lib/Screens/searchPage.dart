import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernow/cubits/getWeatherCubit/weatherCubit.dart';
import 'package:weathernow/cubits/getWeatherCubit/weatherStates.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title:
            const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text("Invalid city name."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Search for a city",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getweathercubit = BlocProvider.of<WeatherCubit>(context);

              await getweathercubit.getCurrentWeather(cityName: value);

              if (context.read<WeatherCubit>().state is FailerState) {
                _showErrorDialog(context);
              } else {
                Navigator.of(context).pop();
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              labelText: "Search",
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              hintText: "Enter city name",
              hintStyle: const TextStyle(),
              suffixIcon: const Icon(Icons.search),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
