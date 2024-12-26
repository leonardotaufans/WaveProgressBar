# waveprogressbar

Readme in progress, idk how to add this to pub.dev

Cloned from https://github.com/baoolong/WaveProgressBar, upgraded to Dart 3.0 and with added features.

![display](https://github.com/leonardotaufans/WaveProgressBar/blob/master/example/WaveProgressBar.gif)

### Square Progress Bar
![square](https://github.com/leonardotaufans/WaveProgressBar/blob/master/example/WaveProgressBar_square.gif)
### Circular Progress Bar
![circular](https://github.com/leonardotaufans/WaveProgressBar/blob/master/example/WaveProgressBar_circular.gif)

## Usage

1. Copy lib/waveprogressbar_flutter.dart to your lib folder.
2. Import it to your dart file:
    import 'package:[your_package]/waveprogressbar_flutter.dart';
3. Initialize the WaterController on your class:
    WaterController _controller = WaterController();
4. Add it as your widget (remember to make the class Stateful!):
    ```dart
   WaveProgressBar(
        size: Size(80, 80), // Size of your widget
        percentage: 0.4,  // Double, range from 0 to 1
        textStyle: DefaultTextStyle(),  // Style of the percentage itself
        barType: WaveProgressBarType.square,  // Optional: Progress Bar shape, defaults to circular
        heightController: _controller  // The controller previously initialized
   )
    ```
6. To change the progress bar, use WaterController's method changeWaterHeight. Keep in mind that the progress bar is double from 0-1:
        ```
       _controller.changeWaterHeight(progress)
       ```
    
## Example

    import 'package:flutter/material.dart';
    import 'package:my/waveprogressbar_flutter.dart';
    
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

## Properties

| properties         | type             | description                       |
| ----               | ----             | ----                              |
| size               | Size             |   The size of widget    	|
| percentage         | double      		|   Percentage of progress	|
| waveHeight         | double      		|   The wave height   			|
| textStyle          | TextStyle      	|   text style    			|
| waveDistance       | double      		|   1/4 Wave distance    	|
| flowSpeed          | double      		|   The speed of wave 	|
| waterColor         | Color      		|   Water color    			|
| strokeCircleColor  | Color      		|   Stroke Circle Color   	|
| circleStrokeWidth  | double      		|   Circle Stroke Width   	|
| heightController   | WaterController  |   Progress Controller   	|
| WaveProgressBarType | WaveProgressBarType | The type of progress bar (circular or square) |

