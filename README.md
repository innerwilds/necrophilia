## Stillborn Creature.

In this pack you will find the following useless things:
1. TopLeft       TopCenter      TopRight
   CenterLeft    ________       CenterRight
   BottomLeft    BottomCenter   BottomRight
   Similar to [Center] from flutter package, they align [child].
2. Circle. Yes, it creates a circle.

## Usage

```dart
const topLeftCircle = const TopLeft(
  child: Circle(radius: 10.0, color: Colors.red),
);
```