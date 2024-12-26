import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          // listTileTheme: ListTileThemeData(iconColor: Colors.white),
          useMaterial3: true,
          // iconButtonTheme: IconButtonThemeData(
          //     style: IconButton.styleFrom(foregroundColor: Colors.white)),
          // iconTheme: IconThemeData(color: Colors.white),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  foregroundColor: Colors.white)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400)),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double progress = 0;
  WaterController waterController = WaterController();
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WaveProgressBar(
              size: Size(80, 80),
              percentage: progress / 100,
              textStyle: Theme.of(context).textTheme.headlineLarge,
              barType: WaveProgressBarType.square,
              waterColor: Colors.red,
              heightController: waterController),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
            controller: textController,
            onSubmitted: (String value) {
              progress = double.parse(textController.text);
              waterController.changeWaterHeight(progress / 100);
            },
          )
        ],
      ),
    );
  }
}
