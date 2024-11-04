# ASSIGNMENTS

## Assignment 7
### 1. Stateless Widgets and Stateful Widgets
- *Stateless Widgets* are immutable and do not maintain any state. 
  They are used for static UI elements that do not change over time, such as simple text labels. 

- *Stateful Widgets* maintain mutable state and consist of a widget class and a separate state class. 
  They are used when the UI needs to respond to user interactions or other events, such as a checkbox that toggles its checked state.

### 2. Widgets and their uses
- *Scaffold*: This widget provides the basic structure of the application, including the app bar, body, and background color.

- *AppBar*: A material design app bar that displays the title of the app and handles styling, such as background color and text style.

- *Padding*: Used to create padding around the child widget, ensuring that content does not touch the edges of the screen.

- *Column*: Arranges its children vertically. In this case, it contains the info cards and the welcome message.

- *Row*: Arranges its children horizontally. It's used to place the InfoCard widgets side by side.

- *SizedBox*: Adds a fixed amount of vertical space between widgets. This helps in improving the layout spacing.

- *GridView.count*: A scrollable grid that creates a grid layout for the ItemCard widgets, allowing you to specify the number of columns and the spacing between items.

- *Material*: A container that applies material design styling to its child widget, including elevation and background color.

- *InkWell*: A widget that detects taps and provides a ripple effect. It's used here to wrap the ItemCard to make it interactive.

- *Container*: A box model that can contain other widgets. It's used for padding and alignment.

- *Icon*: Displays an icon from the Material Icons set. It's used in ItemCard to represent different actions visually.

- *Text*: A simple text widget for displaying text content. It is used throughout the app for titles, labels, and messages.

- *Card*: A material design card that contains some elevation, making it appear as if it is lifted off the surface. It's used for displaying the info in a visually appealing way.

- *SnackBar*: Displays brief messages at the bottom of the screen, providing feedback on user actions, like tapping on an item.

### 3. Purpose of ```setState()```
setState() is a method used by stateful widgets that notifies the framework whether something in the widget has changed, which triggers a rebuild so that the UI reflects the new state.
For example, if we have a counter widget, setState() will be used to increase the count and automatically update what the we see on the screen

### 4. ```const``` vs ```final```
```final``` is used when we want to create a variable that can be assigned once but whose value can be determined at runtime. 
While ```const``` is used when we want to define a variable whose value is fixed at compile time and can’t change at runtime.

### 5. Steps
1. Creating a flutter app by:
    - Running the following command in the terminal inside the desired directory:

    ```bash
    flutter create unlimited_bacon_mobile
    ```
2. Creating the ```View Product``` ```Add Product``` and ```Logout``` buttons by:
    - Creating a new file in ```unlimited_bacon_mobile/lib``` called ```menu.dart```

    - Write the following code to the ```menu.dart``` file:

    ```dart
        import 'package:flutter/material.dart';

        class MyHomePage extends StatelessWidget {
        final String npm = '2306173321'; // NPM
        final String name = 'Ghaza'; // Name
        final String className = 'KKI'; // Class
        final List<ItemHomePage> items = [
            ItemHomePage("View Product", Icons.shopping_bag),
            ItemHomePage("Add Product", Icons.add),
            ItemHomePage("Logout", Icons.logout),
        ];
        MyHomePage({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            backgroundColor: const Color(0xFFF5EEDC),
            
            appBar: AppBar(
                title: const Text(
                'Unlimited Bacon',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        InfoCard(title: 'NPM', content: npm),
                        InfoCard(title: 'Name', content: name),
                        InfoCard(title: 'Class', content: className),
                    ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                    child: Column(
                        children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                            'Your One Stop Shop For Unlimited Bacon',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                            ),
                            ),
                        ),
                        GridView.count(
                            primary: true,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: items.map((ItemHomePage item) {
                            return ItemCard(item);
                            }).toList(),
                        ),
                        ],
                    ),
                    ),
                ],
                ),
            ),
            );
        }
        }

        class ItemCard extends StatelessWidget {
        final ItemHomePage item; 
        
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
                onTap: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                    SnackBar(content: Text("You have pressed the ${item.name} button!"))
                    );
                },
                child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
        }

        class ItemHomePage {
        final String name;
        final IconData icon;

        ItemHomePage(this.name, this.icon);
        }

        class InfoCard extends StatelessWidget {
        final String title;
        final String content;

        const InfoCard({super.key, required this.title, required this.content});

        @override
        Widget build(BuildContext context) {
            return Card(
            elevation: 2.0,
            child: Container(
                width: MediaQuery.of(context).size.width / 3.5,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                children: [
                    Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(content),
                ],
                ),
            ),
            );
        }
        }
    ```

3. Implementing different colors for each button by:
    - Adding the following code to ```menu.dart``` inside the ```MyHomePage``` widget:

    ```dart
    class MyHomePage extends StatelessWidget {
    final String npm = '2306173321'; // NPM
    final String name = 'Ghaza'; // Name
    final String className = 'KKI'; // Class
    final List<ItemHomePage> items = [
        ItemHomePage("View Product", Icons.shopping_bag, Colors.blue.shade900),
        ItemHomePage("Add Product", Icons.add, Colors.red.shade700),
        ItemHomePage("Logout", Icons.logout, Colors.blueGrey),
    ];
    MyHomePage({super.key});
    ```

4. Displaying a ```Snackbar``` depending on which button is clicked by:
    - Adding the following code inside ```menu.dart``` inside the ```ItemCard``` widget:

    ```dart
        child: InkWell(
            onTap: () {
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                SnackBar(content: Text("You have pressed the ${item.name} button!"))
                );
            },
    ```

DONE!!! \（￣︶￣）/　
</details>