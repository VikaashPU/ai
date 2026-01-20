import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import '../widgets/payment_donut_chart.dart';
import '../widgets/performance_trend_chart.dart';
import 'supplier_login.dart';

class SupplierDashboardPage extends StatelessWidget {
  const SupplierDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🌌 BACKGROUND
          Positioned.fill(
            child: Image.asset('assets/images/space_bg.png', fit: BoxFit.cover),
          ),

          Column(
            children: [
              /// ================= TOP BAR =================
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(0.12)),
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
                    const Icon(Icons.notifications_none, color: Colors.white54),
                    const SizedBox(width: 12),
                    const Icon(Icons.settings, color: Colors.white54),
                  ],
                ),
              ),

              /// ================= BODY =================
              Expanded(
                child: Row(
                  children: [
                    /// ================= SIDEBAR =================
                    /// ================= SIDEBAR =================
                    SizedBox(
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SizedBox.expand(
                          child: DashboardGlassCard(
                            child: Column(
                              children: [
                                /// ================= MENU (SCROLLABLE) =================
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        _sideItem(
                                          Icons.dashboard,
                                          'Dashboard',
                                          active: true,
                                        ),
                                        _sideItem(
                                          Icons.shopping_cart,
                                          'Purchase Orders',
                                        ),
                                        _sideItem(
                                          Icons.local_shipping,
                                          'Deliveries',
                                        ),
                                        _sideItem(
                                          Icons.verified,
                                          'Quality Control',
                                        ),
                                        _sideItem(
                                          Icons.receipt_long,
                                          'Invoices',
                                        ),
                                        _sideItem(Icons.payments, 'Payments'),
                                        _sideItem(Icons.assignment, 'RFQs'),
                                        _sideItem(
                                          Icons.analytics,
                                          'Performance',
                                        ),
                                        _sideItem(
                                          Icons.inventory,
                                          'Inventory Availability',
                                        ),
                                        _sideItem(Icons.help_outline, 'Help'),
                                      ],
                                    ),
                                  ),
                                ),

                                /// ================= LOGOUT (FIXED AT BOTTOM) =================
                                const Divider(color: Colors.white24),

                                ListTile(
                                  leading: const Icon(
                                    Icons.logout,
                                    color: Colors.white70,
                                  ),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(color: Colors.white70),
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

                    /// ================= MAIN CONTENT =================
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome, Bharat Electricals',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Here's your supplier overview",
                                style: TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 24),

                              /// ================= SUPPLIER SCORECARD =================
                              DashboardGlassCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Supplier Scorecard',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Performance Trend',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    /// CONTENT (AUTO HEIGHT — NO OVERFLOW)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /// METRICS
                                        Expanded(
                                          flex: 7,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _metric(
                                                      'Active Purchase Orders',
                                                      '13',
                                                      '₹22.5 Cr',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: _metric(
                                                      'Pending Deliveries',
                                                      '5',
                                                      'Late',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 14),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _metric(
                                                      'Pending Payments',
                                                      '₹80 L',
                                                      'Pending',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: _metric(
                                                      'QC Inspections',
                                                      '1',
                                                      'Inspected',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(width: 16),

                                        /// GRAPH
                                        const Expanded(
                                          flex: 3,
                                          child: PerformanceTrendChart(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              /// ================= LOWER GRID =================
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      children: [
                                        _sectionCard(
                                          'Supplier Scorecard Table',
                                          220,
                                        ),
                                        const SizedBox(height: 16),
                                        _sectionCard(
                                          'Recent Purchase Orders',
                                          200,
                                        ),
                                        const SizedBox(height: 16),
                                        _sectionCard('Pending Deliveries', 160),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        _paymentStatusCard(),
                                        const SizedBox(height: 16),
                                        _sectionCard(
                                          'Inventory Availability',
                                          180,
                                        ),
                                        const SizedBox(height: 16),
                                        _sectionCard(
                                          'Alerts & Recommendations',
                                          140,
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

  static Widget _sideItem(IconData icon, String label, {bool active = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: active
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color.fromARGB(255, 92, 101, 141).withOpacity(0.12),
              border: Border.all(
                color: const Color.fromARGB(255, 70, 82, 109).withOpacity(0.5),
              ),
            )
          : null,
      child: ListTile(
        leading: Icon(icon, color: active ? Colors.cyanAccent : Colors.white70),
        title: Text(
          label,
          style: TextStyle(color: active ? Colors.cyanAccent : Colors.white70),
        ),
      ),
    );
  }

  /// ✅ METRIC TILE (NO GlassCard → NO OVERFLOW)
  static Widget _metric(String title, String value, String sub) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.35)),
        color: Colors.black.withOpacity(0.25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(sub, style: const TextStyle(color: Colors.white38)),
        ],
      ),
    );
  }

  static Widget _sectionCard(String title, double height) {
    return DashboardGlassCard(
      child: SizedBox(
        height: height,
        child: Center(
          child: Text(title, style: const TextStyle(color: Colors.white70)),
        ),
      ),
    );
  }

  static Widget _paymentStatusCard() {
    return DashboardGlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Status', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(
                width: 140,
                height: 140,
                child: PaymentDonutChart(paid: 170, pending: 80),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '₹80 L',
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Pending', style: TextStyle(color: Colors.white54)),
                    SizedBox(height: 14),
                    Text(
                      '₹1.7 Cr',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Paid', style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 76, 81, 112),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Text(
                'Submit Invoice',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
