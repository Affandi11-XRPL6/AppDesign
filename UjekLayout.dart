import 'package:flutter/material.dart';

class UjekLayout extends StatefulWidget {
  const UjekLayout({super.key});

  @override
  _UjekLayoutState createState() => _UjekLayoutState();
}

class _UjekLayoutState extends State<UjekLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 26, 168, 151),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person, color: Colors.white),
        ),
        actions: [
          const Text(
            "Saldo Anda : Rp. 150.000",
            style: TextStyle(color: Colors.white),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'login') {
                // Login action
              } else if (value == 'signup') {
                // Signup action
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'login',
                  child: Text('Login'),
                ),
                const PopupMenuItem(
                  value: 'signup',
                  child: Text('Sign Up'),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 32, 195, 176),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildHeaderIcon(Icons.food_bank_rounded, 'Makan'),
                      _buildHeaderIcon(Icons.payments, 'Bayar'),
                      _buildHeaderIcon(Icons.local_shipping, 'Kirim'),
                      _buildHeaderIcon(Icons.local_mall_outlined, 'Belanja'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildServiceIcon(Icons.beach_access_outlined, 'Liburan'),
                  _buildServiceIcon(Icons.water_drop_outlined, 'Air'),
                  _buildServiceIcon(Icons.electric_bolt_outlined, 'Listrik'),
                  _buildServiceIcon(Icons.medical_services, 'Pembayaran RS'),
                  _buildServiceIcon(Icons.gamepad_outlined, 'Top Up Games'),
                  _buildServiceIcon(Icons.credit_card_rounded, 'Transfer Bank'),
                  _buildServiceIcon(Icons.account_balance_wallet, 'Tabungan'),
                  _buildServiceIcon(Icons.more_horiz, 'LAINNYA'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rekomendasi Makanan Hari Ini',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 180,
              width: 370,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFoodItem(
                      'assets/Food/Air Fryer Steak_ A Quick and Easy Recipe for a….jpeg',
                      'Makan Steak Premium di DimsMeatGuy'),
                  _buildFoodItem(
                      'assets/Food/52c0c1c2-e184-4065-be44-3d5f036ed7f9.jpeg',
                      'Kumpul Bareng dengan MCD'),
                  _buildFoodItem('assets/Food/Sate.jpeg', 'Menikmati Sate sendirian'),
                  _buildFoodItem(
                      'assets/Food/The Best All-You-Can-Eat Buffet in Every State.jpeg',
                      'Serbu Restoran All You Can Eat'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rekomendasi Saat Liburan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 180,
              width: 370,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTravellerItem(
                      'assets/Travel/78 Stunning Mediterranean Houses Everyone Dreams About.jpeg',
                      'Sewa Villa Sekelas'),
                  _buildTravellerItem(
                      'assets/Travel/Premium Photo _ Mount Bromo volcano (Gunung Bromo) during sunrise from viewpoint on Mount Penanjakan.jpeg',
                      'Mendaki Bareng Temen ke Bromo'),
                  _buildTravellerItem('assets/Travel/Raja Ampat, Indonesia✨.jpeg',
                      'Renang di Raja Ampat'),
                ],
              ),
            ),
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color.fromARGB(255, 32, 195, 176),
              unselectedItemColor: const Color.fromARGB(236, 151, 151, 151),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 32, 195, 176),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildFoodItem(String imagePath, String foodName) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(foodName, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTravellerItem(String imagePath, String travel) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(travel, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
