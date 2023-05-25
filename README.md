
# Golden Layout

Golden Layout is a Flutter widget that allows you to elegantly arrange two child widgets according to the Golden Ratio. This package provides an eye-pleasing layout that can be either horizontal or vertical, and you have the flexibility to toggle the visibility of each child independently.

## Features

Golden Ratio Layout: Arrange two child widgets in the pleasing proportions of the Golden Ratio.
Responsive Design: The layout dynamically adapts to the available space, maintaining the Golden Ratio proportions.
Flexible Visibility: Independently control the visibility of each child.
Orientation Control: Easily switch between horizontal and vertical layouts.


## Usage

## Add dependency

Please check the latest version before installation. If there is any problem with the new version, please use the previous version

```dart
dependencies:
  flutter:
    sdk: flutter
  # add golden_ratio_layout
  golden_ratio_layout: ^{latest version}

```

Add the following imports to your Dart code

```dart
import 'package:golden_layout/golden_ratio_layout.dart';

```

#
## Screenshot


![alt text](https://github.com/Ramesh-Giri/golden_layout/blob/main/screenshots/example.png)

![alt text](https://github.com/Ramesh-Giri/golden_layout/blob/main/screenshots/nested.png)

![alt text](https://github.com/Ramesh-Giri/golden_layout/blob/main/screenshots/example_horizontal.png)

![alt text](https://github.com/Ramesh-Giri/golden_layout/blob/main/screenshots/example_vertical.png)


#

properties


Parameter | Description | Example | 
--- | --- | --- | 
GoldenLayout | The primary widget used in MyHomePage. | GoldenLayout(...) |
firstChild and secondChild | 	Two GoldenChild widgets are created. you can choose what widget to display.	 | GoldenChild(child: Container(color: Colors.red), isSmaller: true) |
axis | Sets the orientation of the layout. Can be Axis.vertical or Axis.horizontal. | axis: Axis.vertical |
showFirstChild and showSecondChild | Controls the visibility of each child. Set to true to display the child, or false to hide it. | showFirstChild: true |
GoldenChild.isSmaller | Should be set to true for the widget that you want to appear smaller according to the golden ratio. | GoldenChild(child: Container(color: Colors.red), isSmaller: true) |
#

#

Implementation


```dart

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Golden Layout Demo'),
      ),
      body: GoldenLayout(
        firstChild: GoldenChild(
          child: Container(color: Colors.red),
          isSmaller: true,
        ),
        secondChild: GoldenChild(
          child: Container(color: Colors.green),
        ),
        axis: Axis.vertical,
        showFirstChild: true,
        showSecondChild: true,
      ),
    );
  }
}

```


## Nested Implementation

```dart

GoldenLayout(
        firstChild: GoldenChild(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              color: Colors.black,
            ),
            child: GoldenLayout(
              axis: Axis.vertical,
              firstChild: GoldenChild(
                  isSmaller: true,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      color: Colors.black,
                    ),
                  )),
              secondChild: GoldenChild(
                  isSmaller: true,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      color: Colors.black,
                    ),
                  )),
            ),
          ),
        ),
        secondChild: GoldenChild(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow),
              color: Colors.black,
            ),
          ),
        ),
        axis: Axis.horizontal,
        showFirstChild: true,
        showSecondChild: true,
      )
      
   ```  

#
