// lib/main.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// --- Brand palette ---
const kOrange = Color(0xFFA54205);
const kYellow = Color(0xFFFFEC99);

void main() => runApp(const HappyHub());

class HappyHub extends StatelessWidget {
  const HappyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kOrange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kOrange,
        ).copyWith(primary: kOrange, secondary: kYellow),
        textTheme: GoogleFonts.rubikTextTheme().apply(
          bodyColor: kYellow,
          displayColor: kYellow,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

/*────────────────────────── 1 · Splash ──────────────────────────*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const Shell())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: Center(
        child: Text(
          'Happy Hub',
          style: GoogleFonts.rubik(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: kYellow,
          ),
        ),
      ),
    );
  }
}

/*────────────────────────── 2 · Shell w/ bottom nav ──────────────────────────*/
class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _idx = 0;

  final _pages = const [
    HubScreen(),
    MapStubPage(),
    OrdersStubPage(),
    NotificationsStubPage(),
    ProfileStubPage(),
  ];

  void _onTap(int i) => setState(() => _idx = i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: _onTap,
        selectedItemColor: kYellow,
        unselectedItemColor: kYellow.withOpacity(.6),
        backgroundColor: kOrange,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

/*────────────────────────── 3 · Hub Screen ──────────────────────────*/
class HubScreen extends StatefulWidget {
  const HubScreen({super.key});

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar bares ou promoções',
                  hintStyle: TextStyle(color: kYellow.withOpacity(.7)),
                  prefixIcon: Icon(Icons.search, color: kYellow),
                  filled: true,
                  fillColor: kYellow.withOpacity(.15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kYellow.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kYellow.withOpacity(.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: kYellow),
              ),
              const SizedBox(height: 12),
              // Tabs
              TabBar(
                controller: _tab,
                labelColor: kYellow,
                unselectedLabelColor: kYellow.withOpacity(.6),
                indicatorColor: kYellow,
                tabs: const [
                  Tab(text: 'Favoritos'),
                  Tab(text: 'Histórico'),
                  Tab(text: 'Seguindo'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: const [
          HubContent(), // reuse content for all three for now
          HubContent(),
          HubContent(),
        ],
      ),
    );
  }
}

/*────────────────────────── 4 · Hub Content Widgets ──────────────────────────*/
class HubContent extends StatelessWidget {
  const HubContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 90), // leave space for nav bar
      children: const [
        SizedBox(height: 12),
        _TopBarsSection(),
        SizedBox(height: 24),
        _PromotionsSection(),
      ],
    );
  }
}

/*----- horizontal “top bars of the month” -----*/
class _TopBarsSection extends StatelessWidget {
  const _TopBarsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Bares do mês',
            style: GoogleFonts.rubik(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kYellow,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _bars.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) {
              final bar = _bars[i];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: CachedNetworkImageProvider(bar.logoUrl),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bar.name,
                    style: const TextStyle(fontSize: 12, color: kYellow),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

/*----- vertical promos list -----*/
class _PromotionsSection extends StatelessWidget {
  const _PromotionsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _promos
          .map(
            (p) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: p.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(.55),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  p.barName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'R\$ ${p.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

/*────────────────────────── 5 · Mock data ──────────────────────────*/
class Bar {
  final String name, logoUrl;
  const Bar(this.name, this.logoUrl);
}

class Promo {
  final String title, barName, imageUrl;
  final double price;
  const Promo(this.title, this.barName, this.imageUrl, this.price);
}

const _bars = [
  Bar(
    'Bar do Zé',
    'https://images.unsplash.com/photo-1533777857889-4be7a8d1af64?auto=format&fit=crop&w=200&q=60',
  ),
  Bar(
    'Lord Pub',
    'https://images.unsplash.com/photo-1509669803556-fce81c8d0b36?auto=format&fit=crop&w=200&q=60',
  ),
  Bar(
    'Happy Cow',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?auto=format&fit=crop&w=200&q=60',
  ),
  Bar(
    'Downtown',
    'https://images.unsplash.com/photo-1559622214-f8e9042f4859?auto=format&fit=crop&w=200&q=60',
  ),
];

const _promos = [
  Promo(
    'Chopp 300 ml 2×1',
    'Bar do Zé',
    'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=60',
    5.99,
  ),
  Promo(
    'Caipirinha premium',
    'Lord Pub',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=60',
    12.90,
  ),
  Promo(
    'Combo burger + IPA',
    'Happy Cow',
    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=60',
    29.90,
  ),
];

/*────────────────────────── 6 · Stub pages ──────────────────────────*/
class StubScaffold extends StatelessWidget {
  final String title;
  const StubScaffold(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kOrange,
    body: Center(
      child: Text(
        title,
        style: GoogleFonts.rubik(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: kYellow,
        ),
      ),
    ),
  );
}

class ProfileStubPage extends StubScaffold {
  const ProfileStubPage({super.key}) : super('Perfil');
}

class MapStubPage extends StubScaffold {
  const MapStubPage({super.key}) : super('Mapa (em breve)');
}

class OrdersStubPage extends StubScaffold {
  const OrdersStubPage({super.key}) : super('Pedidos');
}

class NotificationsStubPage extends StubScaffold {
  const NotificationsStubPage({super.key}) : super('Notificações');
}
