import 'package:flutter/material.dart';
import 'login.dart'; // Import the login screen
import 'home.dart'; // Import the home screen, adjust as needed

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Set your custom height here
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 177, 212, 249), // Optional: set background color of the app bar
          leading: PopupMenuButton<String>(
            icon: const Icon(
              Icons.menu, // Menu icon
              semanticLabel: 'menu',
            ),
            onSelected: (value) {
              // Handle menu item selection
              switch (value) {
                case 'Home':
                  // Navigate to the Home page, change as needed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MarketplacePage()), // Adjust to your home page
                  );
                  break;
                case 'Products':
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MarketplacePage()), // Same page for now or add Product Page
                  );
                  break;
                case 'Login':
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                // Use `const` constructors here for performance improvement
                const PopupMenuItem<String>(
                  value: 'Home',
                  child: Text('Home'),
                ),
                const PopupMenuItem<String>(
                  value: 'Products',
                  child: Text('Products'),
                ),
                const PopupMenuItem<String>(
                  value: 'Login',
                  child: Text('Login'),
                ),
              ];
            },
          ),
          title: Align(
            alignment: Alignment.center, // Ensure the title (logo) is centered
            child: Padding(
              padding: const EdgeInsets.only(top: 7.0), // Adjust top padding as needed
              child: Image.asset(
                'assets/logo.png', // Path to your logo image
                height: 55.0, // Adjust the size of the logo
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app), // Sign out icon
              onPressed: () {
                // Navigate to the login page when the button is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductCard(
              imageUrl: 'assets/iphone.png',
              title: 'Iphone 20 Pro Max Super',
              price: 'Rp.5.000.000.000',
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0, // Set elevation to 0.0 to remove the shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)), // Optional: Adjust border radius if needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0), // Adjust the border radius if necessary
            child: Image.network(imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(price, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ),
        ],
      ),
    );
  }
}

