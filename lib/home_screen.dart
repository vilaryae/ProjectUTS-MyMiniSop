import 'package:flutter/material.dart';
import 'models.dart';
import 'product_list_screen.dart';
import 'product_detail_screen.dart';
import 'about_screen.dart';
import 'favorites_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark,
                ],
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 48,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'MyShop Mini',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    'Belanja Mudah & Cepat',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          _drawerItem(
            context,
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _drawerItem(
            context,
            icon: Icons.favorite,
            text: 'Favorit',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FavoritesScreen()),
            ),
          ),
          _drawerItem(
            context,
            icon: Icons.info,
            text: 'About',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}

// ===================================================================
//   HOME SCREEN
// ===================================================================
class HomeScreen extends StatelessWidget {
  // ------------------------------------------------------------------
  // Sample Data
  // ------------------------------------------------------------------
  final List<Category> categories = [
    Category(
      name: 'Makanan',
      icon: Icons.fastfood,
      products: [
        Product(
          name: 'Nasi Goreng',
          icon: Icons.restaurant,
          price: 'Rp 15.000',
          imageUrl: 'assets/images/nasi_goreng.jpg',
        ),
      ],
    ),
    Category(
      name: 'Minuman',
      icon: Icons.local_drink,
      products: [
        Product(
          name: 'Matcha Latte',
          icon: Icons.local_cafe,
          price: 'Rp 12.000',
          imageUrl: 'assets/images/matcha-latte.png',
        ),
      ],
    ),
    Category(
      name: 'Elektronik',
      icon: Icons.devices,
      products: [
        Product(
          name: 'Laptop LOQ',
          icon: Icons.laptop,
          price: 'Rp 5.000.000',
          imageUrl: 'assets/images/LOQ_produk.jpg',
        ),
        Product(
          name: 'Tools Box',
          icon: Icons.build,
          price: 'Rp 150.000',
          imageUrl: 'assets/images/tools_box.jpg',
        ),
      ],
    ),
    Category(
      name: 'Pakaian',
      icon: Icons.checkroom,
      products: [
        Product(
          name: 'Kaos',
          icon: Icons.checkroom,
          price: 'Rp 50.000',
          imageUrl: 'assets/images/kaos.jpeg',
        ),
      ],
    ),
    Category(
      name: 'Kesehatan',
      icon: Icons.health_and_safety,
      products: [
        Product(
          name: 'Kain Perban',
          icon: Icons.health_and_safety,
          price: 'Rp 25.000',
          imageUrl: 'assets/images/kain_perban.jpg',
        ),
      ],
    ),
    Category(
      name: 'Rumah Tangga',
      icon: Icons.home,
      products: [
        Product(
          name: 'Sapu',
          icon: Icons.home,
          price: 'Rp 30.000',
          imageUrl: 'assets/images/sapu.jpg',
        ),
      ],
    ),
  ];

  final List<Product> trendProducts = [
    Product(
      name: 'Laptop LOQ',
      icon: Icons.laptop,
      price: 'Rp 5.000.000',
      imageUrl: 'assets/images/LOQ_produk.jpg',
    ),
    Product(
      name: 'Tools Box',
      icon: Icons.build,
      price: 'Rp 150.000',
      imageUrl: 'assets/images/tools_box.jpg',
    ),
    Product(
      name: 'Kaos',
      icon: Icons.checkroom,
      price: 'Rp 50.000',
      imageUrl: 'assets/images/kaos.jpeg',
    ),
    Product(
      name: 'Nasi Goreng',
      icon: Icons.restaurant,
      price: 'Rp 15.000',
      imageUrl: 'assets/images/nasi_goreng.jpg',
    ),
    Product(
      name: 'Matcha Latte',
      icon: Icons.local_cafe,
      price: 'Rp 12.000',
      imageUrl: 'assets/images/matcha-latte.png',
    ),
    Product(
      name: 'Kain Perban',
      icon: Icons.health_and_safety,
      price: 'Rp 25.000',
      imageUrl: 'assets/images/kain_perban.jpg',
    ),
  ];

  // ------------------------------------------------------------------
  // BUILD UI
  // ------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 600;
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Colors.red.shade700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop Mini'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor.withOpacity(0.04), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 18,
          vertical: isMobile ? 12 : 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------------------------------------
            // HEADER
            // ----------------------------------------------------------
            Text(
              'Selamat Datang di MyShop Mini',
              style: TextStyle(
                fontSize: isMobile ? 20 : 26,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              'Pilih kategori produk yang Anda inginkan:',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            // ----------------------------------------------------------
            // CATEGORY LIST
            // ----------------------------------------------------------
            SizedBox(
              height: isMobile ? 130 : 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final item = categories[i];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductListScreen(category: item),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: isMobile ? 60 : 80,
                          height: isMobile ? 60 : 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                primaryColor.withOpacity(0.15),
                                primaryColor.withOpacity(0.28),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.35),
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            item.icon,
                            size: isMobile ? 28 : 36,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: isMobile ? 70 : 90,
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 11 : 13,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            // ----------------------------------------------------------
            // LABEL TREND
            // ----------------------------------------------------------
            Text(
              'Produk Trend',
              style: TextStyle(
                fontSize: isMobile ? 15 : 18,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // ----------------------------------------------------------
            // HORIZONTAL LIST PRODUK TREND
            // ----------------------------------------------------------
            SizedBox(
              height: isMobile ? 200 : 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 4),
                itemCount: trendProducts.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final p = trendProducts[i];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: p),
                        ),
                      );
                    },
                    child: Container(
                      width: isMobile ? 140 : 180,
                      child: Card(
                        elevation: 5,
                        shadowColor: accentColor.withOpacity(.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(isMobile ? 10 : 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar Produk
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: p.imageUrl != null
                                      ? (p.imageUrl!.startsWith('assets/')
                                            ? Image.asset(
                                                p.imageUrl!,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )
                                            : Image.network(
                                                p.imageUrl!,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ))
                                      : Icon(
                                          p.icon,
                                          size: isMobile ? 48 : 60,
                                          color: accentColor,
                                        ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                p.name,
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
                                p.price,
                                style: TextStyle(
                                  fontSize: isMobile ? 15 : 18,
                                  color: accentColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
