import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import 'procurement_login.dart';

class ProcurementDashboardPage extends StatelessWidget {
  const ProcurementDashboardPage({super.key});

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
                      'Welcome, Procurement Team',
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
                                        _sideItem(Icons.assignment, 'RFQs'),
                                        _sideItem(
                                          Icons.shopping_bag,
                                          'Suppliers',
                                        ),
                                        _sideItem(
                                          Icons.receipt_long,
                                          'Purchase Orders',
                                        ),
                                        _sideItem(Icons.verified, 'Approvals'),
                                        _sideItem(
                                          Icons.analytics,
                                          'Spend Analytics',
                                        ),
                                        _sideItem(Icons.inventory, 'Inventory'),
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
                                            const ProcurementLoginPage(),
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
                                'Welcome, Procurement Team',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Here's your procurement overview",
                                style: TextStyle(color: Colors.white70),
                              ),

                              const SizedBox(height: 24),

                              /// ================= PROCUREMENT SCORECARD =================
                              DashboardGlassCard(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Procurement Scorecard',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Operational Snapshot',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

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
                                                      'Active RFQs',
                                                      '18',
                                                      'Live',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: _metric(
                                                      'Open POs',
                                                      '42',
                                                      '₹112 Cr',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 14),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: _metric(
                                                      'Pending Approvals',
                                                      '7',
                                                      'Action Needed',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: _metric(
                                                      'Monthly Spend',
                                                      '₹24.8 Cr',
                                                      'Current Month',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(width: 16),

                                        /// PLACEHOLDER PANEL (same size as supplier chart)
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 180,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              border: Border.all(
                                                color: Colors.cyanAccent
                                                    .withOpacity(0.25),
                                              ),
                                              color: Colors.black.withOpacity(
                                                0.25,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Spend Trend',
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                          'RFQs Overview Table',
                                          220,
                                        ),
                                        const SizedBox(height: 16),
                                        _sectionCard(
                                          'Active Purchase Orders',
                                          200,
                                        ),
                                        const SizedBox(height: 16),
                                        _sectionCard('Pending Approvals', 160),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        _sectionCard('Top Suppliers', 220),
                                        const SizedBox(height: 16),
                                        _sectionCard('Inventory Alerts', 160),
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

  /// ✅ METRIC TILE (same as Supplier)
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
}
