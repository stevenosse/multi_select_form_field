# Multi Select Form Field

A dropdown button Widget allowing one to choose multiple elements.

## Install

Add these line under your dependencies section:

```yaml
    multiselect_form_field:
        git:
            url: https://github.com/stevenosse/multi_select_form_field.git
            ref: master
```

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
MultiSelectFormField(
    key: _multiSelectKey,
    tagColor: Colors.blue,
    elementList: List.generate(
        15,
        (index) => MultiSelectFormFieldItem(
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            leading: CircleAvatar(),
            label: "Test $index",
            value: "test",
            isSelected: index.isEven,
        ),
    ),
),
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
