import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import 'procurement_login.dart';

class ProcurementDashboardPage extends StatelessWidget {
  const ProcurementDashboardPage({super.key});

  /// 🎨 THEME COLORS (same as Supplier Dashboard)
  static const Color _activeBg = Color(0xFF0F1E2E);
  static const Color _activeBorder = Color(0xFF1E3A5F);
  static const Color _activeIcon = Color(0xFF7FB3FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      'Welcome, Procurement Team',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 12),
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
                    /// ================= SIDEBAR =================
                    SizedBox(
                      width: 260,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: GlassCard(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _sideItem(Icons.dashboard, 'Dashboard',
                                    active: true),
                                _sideItem(Icons.assignment, 'RFQs'),
                                _sideItem(Icons.shopping_bag, 'Suppliers'),
                                _sideItem(Icons.receipt_long,
                                    'Purchase Orders'),
                                _sideItem(Icons.verified, 'Approvals'),
                                _sideItem(Icons.analytics, 'Spend Analytics'),
                                _sideItem(Icons.inventory, 'Inventory'),
                                _sideItem(Icons.help_outline, 'Help'),
                                const SizedBox(height: 16),
                                const Divider(color: Colors.white24),
                                ListTile(
                                  leading: const Icon(Icons.logout,
                                      color: Colors.white70),
                                  title: const Text(
                                    'Logout',
                                    style:
                                        TextStyle(color: Colors.white70),
                                  ),
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const ProcurementLoginPage(),
                                      ),
                                      (_) => false,
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
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Procurement Overview',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Enterprise procurement summary',
                              style:
                                  TextStyle(color: Colors.white70),
                            ),

                            const SizedBox(height: 24),

                            /// ================= METRICS =================
                            Row(
                              children: [
                                Expanded(
                                  child: _metricCard(
                                      'Active RFQs', '18', ''),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _metricCard(
                                      'Open POs', '42', '₹112 Cr'),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _metricCard(
                                      'Pending Approvals', '7', ''),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _metricCard(
                                      'Monthly Spend', '₹24.8 Cr', ''),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// ================= MAIN PANELS =================
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: GlassCard(
                                      child: Center(
                                        child: Text(
                                          'RFQs • Supplier Performance • Spend Trends',
                                          style: TextStyle(
                                              color:
                                                  Colors.white70),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: GlassCard(
                                            child: Center(
                                              child: Text(
                                                'Approval Queue',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Expanded(
                                          child: GlassCard(
                                            child: Center(
                                              child: Text(
                                                'Top Suppliers',
                                                style: TextStyle(
                                                    color:
                                                        Colors.white70),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

  /// ================= SIDEBAR ITEM =================
  static Widget _sideItem(
    IconData icon,
    String label, {
    bool active = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: active ? _activeBg : Colors.transparent,
        border: active
            ? Border.all(
                color: _activeBorder,
                width: 1.2,
              )
            : null,
        boxShadow: active
            ? [
                BoxShadow(
                  color: _activeBorder.withOpacity(0.6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: active ? _activeIcon : Colors.white70,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: active ? _activeIcon : Colors.white70,
            fontWeight:
                active ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        dense: true,
        horizontalTitleGap: 10,
      ),
    );
  }

  /// ================= METRIC CARD =================
  static Widget _metricCard(
    String title,
    String value,
    String subtitle,
  ) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (subtitle.isNotEmpty)
            Text(subtitle,
                style:
                    const TextStyle(color: Colors.white38)),
        ],
      ),
    );
  }
}
