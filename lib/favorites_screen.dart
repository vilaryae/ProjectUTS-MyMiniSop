import 'package:flutter/material.dart';
import 'models.dart';
import 'product_detail_screen.dart';
import 'home_screen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Sample favorite products - in a real app, this would come from a database or state management
  List<Product> favoriteProducts = [
    Product(
      name: 'Laptop LOQ',
      icon: Icons.laptop,
      price: 'Rp 5.000.000',
      imageUrl: 'assets/images/LOQ_produk.jpg',
    ),
    Product(
      name: 'Matcha Latte',
      icon: Icons.local_cafe,
      price: 'Rp 12.000',
      imageUrl: 'assets/images/matcha-latte.png',
    ),
    Product(
      name: 'Kaos',
      icon: Icons.checkroom,
      price: 'Rp 50.000',
      imageUrl: 'assets/images/kaos.jpeg',
    ),
  ];

  void _removeFromFavorites(Product product) {
    setState(() {
      favoriteProducts.remove(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} dihapus dari favorit'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 600;
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Colors.red.shade700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk Favorit'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor.withOpacity(0.04), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: favoriteProducts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum ada produk favorit',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 22,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tambahkan produk ke favorit untuk melihatnya di sini',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produk Favorit Anda',
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${favoriteProducts.length} produk favorit',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isMobile ? 2 : 3,
                          crossAxisSpacing: isMobile ? 8 : 12,
                          mainAxisSpacing: isMobile ? 8 : 12,
                          childAspectRatio: isMobile ? 0.75 : 0.8,
                        ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shadowColor: accentColor.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(isMobile ? 8 : 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Gambar Produk
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: product.imageUrl != null
                                                ? (product.imageUrl!.startsWith(
                                                        'assets/',
                                                      )
                                                      ? Image.asset(
                                                          product.imageUrl!,
                                                          fit: BoxFit.cover,
                                                          width:
                                                              double.infinity,
                                                        )
                                                      : Image.network(
                                                          product.imageUrl!,
                                                          fit: BoxFit.cover,
                                                          width:
                                                              double.infinity,
                                                        ))
                                                : Icon(
                                                    product.icon,
                                                    size: isMobile ? 50 : 60,
                                                    color: accentColor,
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          product.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: isMobile ? 14 : 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          product.price,
                                          style: TextStyle(
                                            fontSize: isMobile ? 16 : 18,
                                            color: accentColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Tombol hapus dari favorit
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () =>
                                          _removeFromFavorites(product),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red.shade600,
                                          size: isMobile ? 18 : 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
