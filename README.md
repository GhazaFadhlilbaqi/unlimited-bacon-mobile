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

## Assignment 8
### 1. Purpose of ```const```
- In Flutter, the ```const``` keyword is used to define objects whose values would not change as long as the app runs. Using ```const``` can help improve performance, make the code more efficient, and prevent certain objects from being changed after they're created.
- The *advantages* of using the ```const``` keywords are but not limited to:
  - Better Performance:
    
    Allows less memory to be used as well as faster execution
  - Immutability:
    
    Objects with the ```const``` keyword can't be changed which prevents unexpected changes that may cause bugs/errors
  - Easier Hot Reload:
    
    Since objects with ```const``` are immutable, flutter can more easily manage the widget trees during hot reloads
  - Consistency:
    
    Ensures that widgets that are identical/has the same properties to appear the same throughout the app
- The ```const``` keyword *should be used* for:
  
  Widgets that don't change dynamically throughout the app's life, such as Static images, Static Texts and other similar widgets
- The ```const``` keyword *should NOT be used* for:
  
  Widgets that will potentially change throughout the app's life, sucn as product cards whose data require user inputs

### 2. Column vs Row
- Columns are used to display widgets/data in a *vertical manner* (Up to Down), typically used for data inputs in forms
- Example:
```dart
    Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Product Name: $_productName'),
            Text('Price: $_price'),
            Text('Description: $_description'),
            Text('Stock: $_stock')
            ],
        ),
```

- Rows are used to display widgets/data in a *horizontal manner* (Left to Right), typically used for navbars tha display data from left to right
- Example:
```dart
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        InfoCard(title: 'NPM', content: npm),
        InfoCard(title: 'Name', content: name),
        InfoCard(title: 'Class', content: className),
        ],
    ),
```

### 3. Input Elements in Flutter
- Input elements I used in this assignment is the:

    - Textfield:
    ```dart
    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _productName = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Product name cannot be empty!";
                        }
                        if (value.length > 100) {
                        return "Product name cannot be longer than 100 characters!";
                        }
                        return null;
                    },
                    ),
    ```

- Input Elements I did *Not* use are the:
    - Checkbox 
    - Switch
    - Slider
    - DropdownButton
    - Radio

### 4. Flutter Themes
By using the ```ThemeData()``` function inside the ```theme``` object in ```main.dart``` which ensures the app to use the colors of my choosing (red and red accent) for most of my widgets in the app as well as allowing me to use the flutter material pack which allows me to use existing icons which are similar in style
```dart
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
        ).copyWith(secondary: Colors.redAccent[400]),
        useMaterial3: true,
```

### 5. Managing Navigation in a Multi-Page Flutter App
Managing navigation in multi-paged flutter apps are usually handled using the ```Navigator``` widget. The navigator works like the ```stack``` data structure in a sense where:
- ```Navigator.push()```
Is used to go to a new page
- ```Navigator.pop()```
Is used to return to a previous page

DONE!!! \^o^/

## Assignment 9
### 1. Create a model to retrieve/send JSON data
Creating a model allows a lot of things, such as:
- Data Structuring: Helping map JSON data into structured Dart objects, making it easier to access and use.
- Validation and Transformation: Ensuring that the received data has the correct format and type.
- Code Maintenance: The code becomes more organized because each piece of data has a dedicated representation.
If we don't create a model first, it won't cause an error, but it will cause JSON datas to be processed manually, which makes it prone to errors and accessing data becomes more complex and prone to data type mismatches.

### 2. Function of the http library 
The ```http``` library used in this project is used to allow http requests such as GET and POST to be used by the flutter project to interact with the django backend, in this assignment's case:
- GET, is be used to retrieve the product list of users
- POST , is used for logins, registrations, and adding new products

### 3. Function of ```CookieRequest```
The ```CookieRequest``` has several functions, such as:
- Managing Authentication: Storing user login sessions through cookies.
- Simplifying HTTP Requests: Easing the process of sending data with authentication, without needing to manually add headers.
- Supporting Stateful Requests: Retaining the user's login state across multiple requests.
It is necessary to share the ```CookieRequest``` instance with all components or else we would have to send a login request each time we access other components.

### 4. Mechanism of data transmission in flutter
- Inputting Data: The user inputs data through the Flutter app, either from a form or a button event.

- Sending Request: The submitted data is then sent to the server using HTTP or CookieRequest in a specific format (like JSON).

- Backend Processing: 
1. The Django server receives the request data.

2. The backend processes the data (either aving to the database or performing the necessary actions).

3. Django returns a response in JSON format.

- Receiving Response: The Flutter application receives the response from the server.

- Decoding Data: The JSON response is converted into Dart objects (using a model).

- Displaying Data: The converted data is displayed in the Flutter interface.

### 5. Authentication mechanism in flutter and django
- Login:
    1. Inputting Data: The user enters their email and password in the Flutter app.
    2. Sending Request: The data is sent to the Django login endpoint using CookieRequest.
    3. Backend Processing:
        - Django verifies the user's credentials.
        - If successful, the server returns an authentication cookie.
    4. Storing Status: The cookie is stored in CookieRequest for use in subsequent requests.
    5. Displaying Menu: After a successful login, the app's main menu is displayed according to the login status.

- Register:
    1. Input Data: The user enters account information (e.g., name, email, password).
    2. Sending Request: The data is sent to the Django register endpoint using HTTP or CookieRequest.
    3. Backend Processing:
        - Django saves the new user's data to the database.
        - Django returns a success response.
    4. Alerting: Flutter displays a success or error message based on the response.

- Logout Process
    1. Logout Request: Flutter sends a request to the Django logout endpoint using CookieRequest.
    2. Removing Cookies: Django deletes the user's session.
    3. Updating Status: The Flutter app updates the user's status to logged out.
    4. Redirection: The user is redirected back to the login page.

### 6. Steps
1.  Implementing the registration feature:
    - Creating a new app in django called ```authentication``` by:

    ```bash
    python manage.py startapp authentication
    ```
    - Adding the registration function in ```views.py``` of ```authentication```:

    ```python
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)

            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)

            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()

            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)

        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
    ```

    - Route the function to ```urls.py``` in ```authentication```:

    ```python
    ...
    path('register/', register, name='register'),
    ```
    - Create a new file in ```lib/screens``` called ```register.dart```:

    ```dart
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:unlimited_bacon_mobile/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Text('Register'),
            leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
                Navigator.pop(context);
            },
            ),
        ),
        body: Center(
            child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    const Text(
                        'Register',
                        style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                        onPressed: () async {
                        String username = _usernameController.text;
                        String password1 = _passwordController.text;
                        String password2 = _confirmPasswordController.text;

                        // Check credentials
                        // TODO: Change the url, don't forget to add a slash (/) inthe end of the URL!
                        // To connect Android emulator with Django on localhost,
                        // use the URL http://10.0.2.2/
                        final response = await request.postJson(
                            "http://localhost:8000/auth/register/",
                            jsonEncode({
                                "username": username,
                                "password1": password1,
                                "password2": password2,
                            }));
                        if (context.mounted) {
                            if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                content: Text('Successfully registered!'),
                                ),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                            );
                            } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                content: Text('Failed to register!'),
                                ),
                            );
                            }
                        }
                        },
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Register'),
                    ),
                    ],
                ),
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

2.  Creating a login page by:
    - Creating a new file in ```screens``` called ```login.dart```:

    ```dart
    import 'package:unlimited_bacon_mobile/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:unlimited_bacon_mobile/screens/register.dart';

    void main() {
    runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
            ).copyWith(secondary: Colors.redAccent[400]),
        ),
        home: const LoginPage(),
        );
    }
    }

    class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
        ),
        body: Center(
            child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    const Text(
                        'Login',
                        style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                        onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;

            // Check credentials
            // To connect the Android emulator to Django on localhost,
            // use the URL http://10.0.2.2/
                        final response = await request
                            .login("http://localhost:8000/auth/login/", {
                            'username': username,
                            'password': password,
                        });

                        if (request.loggedIn) {
                            String message = response['message'];
                            String uname = response['username'];
                            if (context.mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                            );
                            ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                SnackBar(
                                    content:
                                        Text("$message Welcome, $uname.")),
                                );
                            }
                        } else {
                            if (context.mounted) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                title: const Text('Login Failed'),
                                content: Text(response['message']),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                    ),
                                ],
                                ),
                            );
                            }
                        }
                        },
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Login'),
                    ),
                    const SizedBox(height: 36.0),
                    GestureDetector(
                        onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                        );
                        },
                        child: Text(
                        'Don\'t have an account? Register',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16.0,
                        ),
                        ),
                    ),
                    ],
                ),
                ),
            ),
            ),
        ),
        );
    }
    }
    ```
    - Integrating the Django authentication system with the Flutter project by:
        - Creating the authentication feature in the django's ```authentication``` app:

        ```python
        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    # Successful login status.
                    return JsonResponse({
                        "username": user.username,
                        "status": True,
                        "message": "Login successful!"
                        # Add other data if you want to send data to Flutter.
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login failed, account disabled."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login failed, check email or password again."
                }, status=401)
        ```
        - Installing the ```provider``` and ```pbp_django_auth``` packages to the Flutter project:

        ```bash
        flutter pub add provider
        flutter pub add pbp_django_auth
        ```
        - Modify the ```main.dart``` page to use the newly installed packages:

        ```dart
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        import 'package:unlimited_bacon_mobile/screens/login.dart';

        void main() {
        runApp(const MyApp());
        }

        class MyApp extends StatelessWidget {
        const MyApp({super.key});

        @override
        Widget build(BuildContext context) {
            return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Unlimited Bacon',
                theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: Colors.red,
                ).copyWith(secondary: Colors.redAccent[400]),
                ),
                home: LoginPage(),
            ),
            );
        }
        }
        ```

3. Creating a custom model by:
    - Creating a new directory called ```models``` inside ```lib``` and adding a new file in it called ```product_entry.dart```
    - Populating that file:

    ```dart
    // To parse this JSON data, do
    //
    //     final unlimitedBacon = unlimitedBaconFromJson(jsonString);

    import 'dart:convert';

    List<UnlimitedBacon> unlimitedBaconFromJson(String str) => List<UnlimitedBacon>.from(json.decode(str).map((x) => UnlimitedBacon.fromJson(x)));

    String unlimitedBaconToJson(List<UnlimitedBacon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class UnlimitedBacon {
        String model;
        String pk;
        Fields fields;

        UnlimitedBacon({
            required this.model,
            required this.pk,
            required this.fields,
        });

        factory UnlimitedBacon.fromJson(Map<String, dynamic> json) => UnlimitedBacon(
            model: json["model"],
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

        Map<String, dynamic> toJson() => {
            "model": model,
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
        int user;
        String name;
        int price;
        String description;
        double stock;

        Fields({
            required this.user,
            required this.name,
            required this.price,
            required this.description,
            required this.stock,
        });

        factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            user: json["user"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            stock: json["stock"]?.toDouble(),
        );

        Map<String, dynamic> toJson() => {
            "user": user,
            "name": name,
            "price": price,
            "description": description,
            "stock": stock,
        };
    }

    ```

4. Creating a page containing a list of all items by:
    - Creating a new file inside ```screens``` called ```list_productentry```:

    ``` dart
    import 'package:flutter/material.dart';
    import 'package:unlimited_bacon_mobile/widgets/left_drawer.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:unlimited_bacon_mobile/models/product_entry.dart';

    class ProductEntryPage extends StatefulWidget {
    const ProductEntryPage({super.key});

    @override
    State<ProductEntryPage> createState() => _ProductEntryPageState();
    }

    class _ProductEntryPageState extends State<ProductEntryPage> {
    Future<List<UnlimitedBacon>> fetchProduct(CookieRequest request) async {
        // Don't forget to add the trailing slash (/) at the end of the URL!
        final response = await request.get('http://localhost:8000/json/');

        // Decoding the response into JSON
        var data = response;

        // Convert json data to a ProductEntry object
        List<UnlimitedBacon> listProduct = [];
        for (var d in data) {
        if (d != null) {
            listProduct.add(UnlimitedBacon.fromJson(d));
        }
        }
        return listProduct;
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Check out our products!'
                )
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Column(
                children: [
                    Text(
                    'There are no products available.',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                    color: Colors.red, // Set the background color to red
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                        ),
                    ],
                    ),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                        "${snapshot.data[index].fields.name}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set the text color to white
                        ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                        "${snapshot.data[index].fields.price}",
                        style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                        const SizedBox(height: 10),
                        Text(
                        "${snapshot.data[index].fields.description}",
                        style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                        const SizedBox(height: 10),
                        Text(
                        "${snapshot.data[index].fields.stock}",
                        style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                    ],
                    ),
                ),
                );
            }
            },
        ),
        );
    }
    }
    ```

5.  Creating a detail page of each listed item by:
    - Modifying the ```list_productentry.dart``` file:

    ```dart
    import 'package:flutter/material.dart';
    import 'package:unlimited_bacon_mobile/widgets/left_drawer.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:unlimited_bacon_mobile/models/product_entry.dart';
    import 'package:unlimited_bacon_mobile/screens/product_detail.dart';

    class ProductEntryPage extends StatefulWidget {
    const ProductEntryPage({super.key});

    @override
    State<ProductEntryPage> createState() => _ProductEntryPageState();
    }

    class _ProductEntryPageState extends State<ProductEntryPage> {
    Future<List<UnlimitedBacon>> fetchProduct(CookieRequest request) async {
        // Don't forget to add the trailing slash (/) at the end of the URL!
        final response = await request.get('http://localhost:8000/json/');

        // Decoding the response into JSON
        var data = response;

        // Convert json data to a ProductEntry object
        List<UnlimitedBacon> listProduct = [];
        for (var d in data) {
        if (d != null) {
            listProduct.add(UnlimitedBacon.fromJson(d));
        }
        }
        return listProduct;
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Text('Product List'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Column(
                children: [
                    Text(
                    'There are no products available.',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            product: snapshot.data[index],
                        ),
                        ),
                    );
                    },
                    child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.red, // Set the background color to red
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                        ),
                        ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "${snapshot.data[index].fields.name}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set the text color to white
                            ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "${snapshot.data[index].fields.price}",
                            style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "${snapshot.data[index].fields.description}",
                            style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "${snapshot.data[index].fields.stock}",
                            style: const TextStyle(color: Colors.white), // Set the text color to white
                        ),
                        ],
                    ),
                    ),
                ),
                );
            }
            },
        ),
        );
    }
    }
    ```
    - Add a new file in ```screens``` called ```product_detail.dart```:

    ```dart
    import 'package:flutter/material.dart';
    import 'package:unlimited_bacon_mobile/models/product_entry.dart';

    class ProductDetailPage extends StatelessWidget {
    final UnlimitedBacon product;

    const ProductDetailPage({super.key, required this.product});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('Product Details'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                product.fields.name,
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10),
                Text(
                'Price: \$${product.fields.price}',
                style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Text(
                'Description: ${product.fields.description}',
                style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Text(
                'Stock: ${product.fields.stock}',
                style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary, // Set the background color to the secondary theme color
                ),
                child: const Text(
                    'Back to Product List',
                    style: TextStyle(
                    color: Colors.white, // Set the text color to white
                    ),
                ),
                ),
            ],
            ),
        ),
        );
    }
    }
    ```

6. Filtering products based on user by:
    - Having this chunk of code inside ```list_productentry.dart```:

    ```dart
    // Convert json data to a ProductEntry object
    List<UnlimitedBacon> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(UnlimitedBacon.fromJson(d));
      }
    }
    return listProduct;
    }
    ```

DONE!!! (_　_)。゜zｚＺ
