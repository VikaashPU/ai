import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import 'procurement_dashboard.dart';

class ProcurementLoginPage extends StatelessWidget {
  const ProcurementLoginPage({super.key});

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
                      /// 🔷 LOGO INSIDE FORM
                      Image.asset(
                        'assets/images/powerxchange_logo.png',
                        height: 48,
                      ),
                      const SizedBox(height: 18),

                      const Text(
                        'Procurement Portal',
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
                          'Secure, AI-driven procurement for utilities and energy enterprises',
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
                      _glassDropdown(),
                      const SizedBox(height: 16),

                      _glassInput(
                        hint: 'Officer Email Address',
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

                      const SizedBox(height: 20),

                      /// 🔥 FULL-WIDTH LOGIN BUTTON
                      _glowButton(
                        text: 'Login to Procurement Portal',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const ProcurementDashboardPage(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 18),

                      /// ACTION LINKS
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Request Procurement Access',
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Quick Onboarding',
                              style: TextStyle(
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ),
                        ],
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18),
            hintText: hint,
            hintStyle:
                const TextStyle(color: Colors.white54),
            prefixIcon:
                Icon(icon, color: Colors.white70),
            suffixIcon: suffix,
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.18),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color:
                    Colors.cyanAccent.withOpacity(0.9),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= DROPDOWN =================
  static Widget _glassDropdown() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: DropdownButtonFormField<String>(
          value: 'officer',
          dropdownColor: Colors.black.withOpacity(0.9),
          style: const TextStyle(color: Colors.white),
          items: const [
            DropdownMenuItem(
              value: 'officer',
              child: Text(
                'Procurement Officer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          onChanged: (_) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            prefixIcon: const Icon(
              Icons.person_outline,
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.18),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color:
                    Colors.cyanAccent.withOpacity(0.9),
              ),
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
            colors: [
              Color(0xFF66F2FF),
              Color(0xFF2BB3FF),
            ],
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
}
