# Multi Select Form Field

A dropdown button Widget allowing one to choose multiple elements.

## Install

*Not on pub yet*

## Demo

![alt text](./demo.gif "Demo gif")

### Features
- Regular widget
- Very simple to implement
- Can retrieve the list of selected elements
- Build custom list elements
- Can retrieve the list of unselected elements

### Example

```dart
MultiSelectField(
    key: _multiSelectKey,
    tagColor: Colors.yellow,
    listItemBuilder: (Map<String, dynamic> item) {
       return MultiSelectFieldListItem(
        onSelected: () {
            item = true;
            setState(() {});
        },
        label: item['display'],
        selected: item['isSelected'],
      );
    },
    elementList: [
        {
            'display': "John Doe",
            'isSelected': true,
            'value': 1
        },
        {
            'display': "Jane Doe",
            'isSelected': false,
            'value': 2
        },
        {
            'display': "Tim Cook",
            'isSelected': false,
            'value': 3
        },
    ],  
)
```


## Retrieve more parameters

Give a Key to the widget, declared like : 
```dart
    final GlobalKey<MultiSelectFieldState> _multiSelectKey = GlobalKey();`
    
```

And then : 
```dart
    var selectedElements = _multiSelectKey.currentState.selectedElements; // Retrieve all the selected elements
    var unselectedElements = _multiSelectKey.currentState.unselectedElements; // Retrieve all the unselected elements
```
## Contribute
Every contributions are welcomed