import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import '../widgets/payment_donut_chart.dart';
import 'supplier_login.dart';

class SupplierDashboardPage extends StatelessWidget {
  const SupplierDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// 🌌 SPACE BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'assets/images/space_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            children: [
              /// ================= TOP BAR =================
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: Colors.white.withOpacity(0.12)),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/powerxchange_logo.png',
                      height: 26,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'PowerXchange.ai',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Welcome, Bharat Electricals',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.notifications_none,
                        color: Colors.white54),
                    const SizedBox(width: 12),
                    const Icon(Icons.settings, color: Colors.white54),
                  ],
                ),
              ),

              /// ================= BODY =================
              Expanded(
                child: Row(
                  children: [
                    /// ========== SIDEBAR (SCROLLABLE) ==========
                    SizedBox(
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: GlassCard(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _sideItem(Icons.dashboard, 'Dashboard',
                                    active: true),
                                _sideItem(Icons.shopping_cart,
                                    'Purchase Orders'),
                                _sideItem(Icons.local_shipping,
                                    'Deliveries'),
                                _sideItem(Icons.verified,
                                    'Quality Control'),
                                _sideItem(Icons.receipt_long, 'Invoices'),
                                _sideItem(Icons.payments, 'Payments'),
                                _sideItem(Icons.assignment, 'RFQs'),
                                _sideItem(Icons.analytics, 'Performance'),
                                _sideItem(Icons.inventory,
                                    'Inventory Availability'),
                                _sideItem(Icons.help_outline, 'Help'),
                                const SizedBox(height: 16),
                                const Divider(color: Colors.white24),
                                ListTile(
                                  leading: const Icon(Icons.logout,
                                      color: Colors.white70),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.white70),
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const SupplierLoginPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// ========== MAIN CONTENT ==========
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome, Bharat Electricals',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Here's your supplier overview",
                                style:
                                    TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 24),

                              /// ===== METRIC CARDS =====
                              Row(
                                children: [
                                  Expanded(
                                      child: _metric(
                                          'Active Purchase Orders',
                                          '13',
                                          '₹22.5 Cr')),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: _metric(
                                          'Pending Deliveries',
                                          '5',
                                          'Late')),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: _metric(
                                          'Pending Payments',
                                          '₹80 L',
                                          'Pending')),
                                  const SizedBox(width: 16),
                                  Expanded(
                                      child: _metric(
                                          'QC Inspections',
                                          '1',
                                          'Inspected')),
                                ],
                              ),

                              const SizedBox(height: 24),

                              /// ===== LOWER GRID =====
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  /// LEFT COLUMN
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        GlassCard(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 50),
                                            child: const Center(
                                              child: Text(
                                                'Supplier Scorecard Table',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        GlassCard(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 40),
                                            child: const Center(
                                              child: Text(
                                                'Recent Purchase Orders',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  /// RIGHT COLUMN
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        GlassCard(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                            children: [
                                              const Text(
                                                'Payment Status',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70,
                                                    fontSize: 15),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  const PaymentDonutChart(
                                                    paid: 170,
                                                    pending: 80,
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        '₹80 L',
                                                        style: TextStyle(
                                                          color: Colors
                                                              .cyanAccent,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text('Pending',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white54)),
                                                      SizedBox(height: 14),
                                                      Text(
                                                        '₹1.7 Cr',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.white,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      Text('Paid',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white54)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        GlassCard(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 45),
                                            child: const Center(
                                              child: Text(
                                                'Inventory Availability',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ================= HELPERS =================

  static Widget _sideItem(IconData icon, String label,
      {bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: active
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.cyanAccent.withOpacity(0.12),
              border: Border.all(
                  color: Colors.cyanAccent.withOpacity(0.5)),
            )
          : null,
      child: ListTile(
        leading: Icon(icon,
            color:
                active ? Colors.cyanAccent : Colors.white70),
        title: Text(
          label,
          style: TextStyle(
              color:
                  active ? Colors.cyanAccent : Colors.white70),
        ),
      ),
    );
  }

  static Widget _metric(String title, String value, String sub) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (sub.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                sub,
                style:
                    const TextStyle(color: Colors.white38),
              ),
            ),
        ],
      ),
    );
  }
}
