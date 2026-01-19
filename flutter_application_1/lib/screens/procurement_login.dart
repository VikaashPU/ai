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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// 🔷 BRAND HEADER
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRect(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            widthFactor:
                                0.99, // 👈 THIS trims right-side transparent padding
                            child: Image.asset(
                              'assets/images/powerxchange_logo.png',
                              height: 40,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),
                        const Text(
                          'PowerXchange.ai',
                          textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.0,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

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

                    /// 🔷 GLASS FORM
                    LoginGlassCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 320, child: _glassDropdown()),

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

                          /// 🔹 OR DIVIDER
                          const SizedBox(height: 14),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white24,
                                  thickness: 0.6,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white24,
                                  thickness: 0.6,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          _glassOutlineButton(
                            text: 'Request Procurement Access',
                            onTap: () {},
                          ),

                          const SizedBox(height: 6),

                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Quick Onboarding',
                              style: TextStyle(color: Colors.cyanAccent),
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'Procurement onboarding is restricted to authorized personnel and subject to verification.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 11.5,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
            prefixIcon: const Icon(Icons.person_outline, color: Colors.white70),
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
      width: 320,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),

          // 🔥 DARK, PREMIUM BUTTON (MATCHES IMAGE)
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0E2A47), // dark navy
              Color(0xFF1E5AA8), // deep electric blue
            ],
          ),

          // 🔹 SUBTLE BLUE GLOW (NOT CYAN)
          boxShadow: [
            BoxShadow(
              color: Color(0xFF1E5AA8).withOpacity(0.35),
              blurRadius: 18,
              spreadRadius: 0.3,
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
              fontSize: 15,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }

  /// ================= GLASS OUTLINE BUTTON =================
  static Widget _glassOutlineButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 320,
      height: 44,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.03),
          border: Border.all(
            color: const Color.fromARGB(255, 93, 109, 139).withOpacity(0.7),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.25),
              blurRadius: 14,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
