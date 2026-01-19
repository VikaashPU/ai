import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import 'supplier_dashboard.dart';

class SupplierLoginPage extends StatelessWidget {
  const SupplierLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🌌 SPACE BACKGROUND
          Positioned.fill(
            child: Image.asset('assets/images/space_bg.png', fit: BoxFit.cover),
          ),

          /// ✨ SOFT AMBIENT GLOW
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.cyanAccent.withOpacity(0.06),
                    Colors.transparent,
                  ],
                  radius: 1.2,
                ),
              ),
            ),
          ),

          /// ================= CONTENT =================
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: GlassCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// 🔷 LOGO + BRAND NAME
                      /// 🔷 LOGO + TEXT (PIXEL-CLOSE MATCH)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/powerxchange_logo.png',
                            height: 44, // matches reference icon height
                          ),
                          const SizedBox(width: 6), // tight gap like screenshot
                          const Text(
                            'PowerXchange.ai',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.0, // removes font vertical padding
                              letterSpacing: 0.2, // same tracking as reference
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Supplier Portal',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),

                      const SizedBox(
                        width: 420,
                        child: Text(
                          'AI-enabled access for approved manufacturers, OEMs, and authorized suppliers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.4,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// ================= INPUTS =================
                      _glassInput(
                        hint: 'Supplier Email Address',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16),

                      _glassInput(
                        hint: 'Password',
                        icon: Icons.lock_outline,
                        obscure: true,
                        suffix: const Icon(
                          Icons.visibility_off,
                          color: Colors.white38,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      /// 🔥 FULL-WIDTH LOGIN BUTTON
                      _glowButton(
                        text: 'Login to Supplier Portal',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SupplierDashboardPage(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 18),

                      /// OR DIVIDER
                      Row(
                        children: [
                          Expanded(child: _divider()),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'OR',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                          Expanded(child: _divider()),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// ACTION BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            style: _outlineStyle(),
                            onPressed: () {},
                            child: const Text('Apply as Supplier'),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            style: _outlineStyle(),
                            onPressed: () {},
                            child: const Text('Quick Onboarding'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        'Supplier onboarding is subject to approval and compliance verification',
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= INPUT =================
  static Widget _glassInput({
    required String hint,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: TextFormField(
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: Icon(icon, color: Colors.white70),
            suffixIcon: suffix,
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.18)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.cyanAccent.withOpacity(0.9)),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= FULL-WIDTH GLOW BUTTON =================
  static Widget _glowButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: const LinearGradient(
            colors: [Color(0xFF66F2FF), Color(0xFF2BB3FF)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.6),
              blurRadius: 24,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _divider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.cyanAccent.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  static ButtonStyle _outlineStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: Colors.cyanAccent,
      side: BorderSide(color: Colors.cyanAccent.withOpacity(0.6)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    );
  }
}
