import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang MyShop Mini'),
        backgroundColor: primaryColor,
        elevation: 2,
      ),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryColor.withOpacity(0.05), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: MediaQuery.of(context).size.width < 600
              ? const EdgeInsets.all(16.0)
              : const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header dengan icon
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      size: MediaQuery.of(context).size.width < 600 ? 80 : 100,
                      color: primaryColor,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'MyShop Mini',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 600
                            ? 28
                            : 32,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'Belanja Mudah & Cepat',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 600
                            ? 16
                            : 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              // Card tentang aplikasi
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tentang Aplikasi',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 20
                              : 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'MyShop Mini adalah aplikasi e-commerce modern yang dirancang untuk memberikan pengalaman berbelanja yang sederhana, cepat, dan menyenangkan. Dengan antarmuka yang intuitif dan fitur-fitur canggih, kami memudahkan Anda menemukan produk berkualitas dengan harga terbaik.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 14
                              : 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Card fitur utama
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fitur Utama',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 20
                              : 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildFeatureItem(
                        Icons.category,
                        'Kategori Produk Lengkap',
                        'Temukan berbagai produk dalam kategori Makanan, Minuman, Elektronik, Pakaian, Kesehatan, dan Rumah Tangga.',
                      ),
                      _buildFeatureItem(
                        Icons.grid_view,
                        'Tampilan Grid Modern',
                        'Jelajahi produk dengan tampilan grid yang responsif dan mudah dinavigasi.',
                      ),
                      _buildFeatureItem(
                        Icons.info,
                        'Detail Produk Lengkap',
                        'Lihat informasi detail produk termasuk harga, deskripsi, dan informasi pengiriman.',
                      ),
                      _buildFeatureItem(
                        Icons.phone_android,
                        'Responsive Design',
                        'Pengalaman optimal di semua perangkat, baik mobile maupun desktop.',
                      ),
                      _buildFeatureItem(
                        Icons.palette,
                        'UI Modern & Menarik',
                        'Antarmuka yang indah dengan gradient dan animasi yang halus.',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Card teknologi
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teknologi',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 20
                              : 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlutterLogo(size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Built with Flutter',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Aplikasi ini dibangun menggunakan Flutter framework untuk performa tinggi dan pengalaman pengguna yang konsisten di berbagai platform.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 14
                              : 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Footer
              Center(
                child: Column(
                  children: [
                    Text(
                      'Dibuat dengan ❤️ untuk pengalaman berbelanja terbaik',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 600
                            ? 14
                            : 16,
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue.shade600, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
