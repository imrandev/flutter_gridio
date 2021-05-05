import 'package:flutter/material.dart';

typedef GridioWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class Gridio<T> extends StatelessWidget {

  final List<T> items;
  final T value;
  final Function(T) onChanged;
  final GridioWidgetBuilder<T> itemBuilder;
  final ScrollPhysics physics;

  Gridio({
    @required this.items,
    @required this.value,
    @required this.onChanged,
    @required this.itemBuilder,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return GridioTile<T>(
          value: items[index],
          onValueChanged: onChanged,
          groupValue: value,
          child: itemBuilder(context, items[index]),
        );
      },
    );
  }
}

class GridioTile<T> extends StatelessWidget {

  final T value;
  final T groupValue;
  final Widget child;
  final Function(T) onValueChanged;


  GridioTile({
    @required this.value,
    @required this.groupValue,
    @required this.child,
    @required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onValueChanged(this.value);
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10,),
        decoration: BoxDecoration(
            color: value == groupValue ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            border: Border.all(
              color: Colors.blue,
              width: value == groupValue ? 0 : 2,
            )),
        child: child,
      ),
    );
  }
}