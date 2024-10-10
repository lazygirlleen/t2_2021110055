import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.welcomeMessage,
  });

  final String welcomeMessage;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // Variabel untuk menyimpan produk yang dipilih
  String selectedCategory = 'Favorite';
  // List<String> allItems = [
  //   'Sawi',
  //   'Kentang', 
  //   'Kubis', 
  //   'Kacang Tanah', 'Labu Kuning', 'Wortel'];
  // List<String> filteredItems = [];

  

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    String searchText = '';

    void onSearchChanged() {
      searchText = searchController.text;
      ('Kata yang dicari: $searchText');
    }

    // Method untuk mengubah kategori yang dipilih
    void onCategorySelected(String category) {
      setState(() {
        selectedCategory = category;
      });
    }


    // Method untuk mendapatkan daftar produk sesuai dengan kategori yang dipilih
    List<Widget> getProductWidgets() {
      if (selectedCategory == 'Favorite') {
        return [
          _buildProductCard('Kentang', 'Rp. 14.000/kg', const Color.fromARGB(255, 253, 234, 165), true),
          const SizedBox(width: 16.0),
          _buildProductCard('Kubis Hijau', 'Rp. 28.000/kg', const Color.fromARGB(255, 165, 253, 238), true),
        ];
      } else if (selectedCategory == 'Sawi') {
        return [
          _buildProductCard('Sawi Hijau', 'Rp. 13.500/kg', const Color.fromARGB(255, 187, 240, 190), false),
        ];
      } else if (selectedCategory == 'Kubis') {
        return [
          _buildProductCard('Kubis', 'Rp. 12.000/kg', const Color.fromARGB(255, 160, 253, 165), false),
        ];
      } else if (selectedCategory == 'Kacang') {
        return [
          _buildProductCard('Kacang Tanah', 'Rp. 20.000/kg', const Color.fromARGB(255, 200, 200, 200), false),
        ];
      }
      return [];
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message
            Text(
              widget.welcomeMessage,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Dengan kondisi dan harga terbaik',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 147, 147, 147),
              ),
            ),
            const SizedBox(height: 16),

            // Search field
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari Sayuran',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 198, 198, 198),
                ),
                prefixIcon: const Icon(Icons.search, size: 24),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: (value) {
                onSearchChanged();
              },
            ),
            const SizedBox(height: 16),

            // Button row
            Row(
              children: [
                _buildButton('Favorite', () => onCategorySelected('Favorite')),
                const SizedBox(width: 10),
                _buildButton('Sawi', () => onCategorySelected('Sawi')),
                const SizedBox(width: 10),
                _buildButton('Kubis', () => onCategorySelected('Kubis')),
                const SizedBox(width: 10),
                _buildButton('Kacang', () => onCategorySelected('Kacang')),
              ],
            ),
            const SizedBox(height: 16),

            // Display products based on the selected category
            Row(
              children: getProductWidgets(),
            ),
            const SizedBox(height: 16),

            const Text(
              'Lagi Diskon Nih',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Discounted product container
            const SizedBox(width: 16.0),
            _buildDiscountedProduct(
              'Labu Kuning',
              'Cocok untuk menurunkan berat badan',
              'Rp. 9.600/kg',
              'Rp. 12.000/kg',
              const Color.fromARGB(255, 242, 244, 244),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
    );
  }

  // Modify _buildProductCard to conditionally show favorite icon
  Widget _buildProductCard(String name, String price, Color color, bool isFavorite) {
    return SizedBox(
      width: 130.0,
      height: 130.0,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (isFavorite) // Only show favorite icon if the product is a favorite
                  const Icon(Icons.favorite, color: Colors.red),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Icon(Icons.add_box, color: Colors.orangeAccent),
            Text(
              price,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountedProduct(String name, String desc, String price, String real, Color color) {
    return SizedBox(
      width: 350.0,
      height: 100.0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 254, 250),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 202, 200, 200).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 5), 
      ),
    ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 255, 171, 3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    real,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
