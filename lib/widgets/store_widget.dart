import 'package:flutter/material.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    String searchText = '';

    void onSearchChanged() {
      searchText = searchController.text;
      ('Kata yang dicari: $searchText');
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: const Text(
          'Lengkapi Nutrisimu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Cari Sayuran',
            hintStyle: const TextStyle(
              color:  Color.fromARGB(255, 198, 198, 198), 
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

            // Product items (displayed two per row)
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildProductItem('Wortel', 'Rp. 12.000/kg', const Color.fromARGB(255, 251, 237, 190)),
                _buildProductItem('Tomat', 'Rp. 13.500/kg', const Color.fromARGB(255, 187, 240, 250)),
                _buildProductItem('Labu Kuning', 'Rp. 9.600/kg', const Color.fromARGB(255, 247, 247, 247)),
                _buildProductItem('Sawi Hijau', 'Rp. 13.500/kg', const Color.fromARGB(255, 182, 223, 216)),
                _buildProductItem('Paprika', 'Rp. 34.000/kg', const Color.fromARGB(255, 253, 244, 226)),
                _buildProductItem('Bawang', 'Rp. 65.500/kg', const Color.fromARGB(255, 209, 251, 244)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create product item widget
  Widget _buildProductItem(String name, String price, Color color) {
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
            const Icon(
              Icons.add_box,
              color: Colors.orangeAccent),
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
}
