import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:html' as html;

void main() {
  runApp(const MultiplicationGame());
}

class MultiplicationGame extends StatelessWidget {
  const MultiplicationGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Math Masters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Screen with Avatar Popup
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _showWelcomeDialog = true;

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a2a6c),
              Color(0xFFb21f1f),
              Color(0xFFfdbb2d),
            ],
          ),
        ),
        child: Stack(
          children: [
            if (!isMobile) ...[
              Positioned(
                top: isDesktop ? 50 : 30,
                right: isDesktop ? 50 : 30,
                child: _buildElementBadge('assets/air_symbol.jpg', isDesktop ? 80 : 60),
              ),
              Positioned(
                bottom: isDesktop ? 100 : 80,
                left: isDesktop ? 50 : 30,
                child: _buildElementBadge('assets/water_symbol.jpg', isDesktop ? 80 : 60),
              ),
              Positioned(
                top: isDesktop ? 200 : 150,
                left: isDesktop ? 100 : 80,
                child: _buildElementBadge('assets/earth_symbol.jpg', isDesktop ? 80 : 60),
              ),
              Positioned(
                bottom: isDesktop ? 200 : 150,
                right: isDesktop ? 100 : 80,
                child: _buildElementBadge('assets/fire_symbol.jpg', isDesktop ? 80 : 60),
              ),
            ],

            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Container(
                  width: isDesktop ? 900 : isTablet ? 700 : screenSize.width * 0.95,
                  padding: EdgeInsets.all(isMobile ? 20 : 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFF8B4513),
                      width: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 40,
                              vertical: isMobile ? 15 : 20,
                            ),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF1a2a6c),
                                  Color(0xFFb21f1f),
                                  Color(0xFFfdbb2d),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Text(
                              'AVATAR MATH MASTERS',
                              style: TextStyle(
                                fontSize: isDesktop ? 42 : isTablet ? 36 : 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                letterSpacing: 2,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isMobile ? 20 : 40),

                      Container(
                        width: isDesktop ? 300 : isTablet ? 250 : 200,
                        height: isDesktop ? 400 : isTablet ? 333 : 266,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF8B4513),
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/avatar_main.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, st) => Container(
                              color: const Color(0xFFE0F7FA),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.auto_awesome, 
                                      size: isMobile ? 40 : 80, 
                                      color: const Color(0xFF1a2a6c)),
                                  SizedBox(height: isMobile ? 10 : 20),
                                  const Text(
                                    'Avatar Aang',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF1a2a6c),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 20 : 40),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFb21f1f).withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const GradeSelectionScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb21f1f),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 40 : 60,
                              vertical: isMobile ? 16 : 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, 
                                  size: isMobile ? 24 : 30, 
                                  color: Colors.white),
                              SizedBox(width: isMobile ? 10 : 15),
                              Text(
                                'BEGIN YOUR JOURNEY',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 20),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: _openWebsite,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1a2a6c),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 30,
                              vertical: isMobile ? 12 : 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: Icon(Icons.exit_to_app, 
                              size: isMobile ? 18 : 24, 
                              color: Colors.white),
                          label: Text(
                            'RETURN TO GAMIFY',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 10 : 15),

                      // Main Menu Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B4513).withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _showWelcomeDialog = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8B4513),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 30,
                              vertical: isMobile ? 12 : 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: Icon(Icons.home, 
                              size: isMobile ? 18 : 24, 
                              color: Colors.white),
                          label: Text(
                            'MAIN MENU',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            if (_showWelcomeDialog)
              _buildWelcomeDialog(isMobile, isTablet, isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _buildElementBadge(String assetPath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (ctx, err, st) => Icon(
            Icons.ac_unit,
            size: size * 0.6,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeDialog(bool isMobile, bool isTablet, bool isDesktop) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          width: isDesktop ? 600 : isTablet ? 500 : 350,
          padding: EdgeInsets.all(isMobile ? 20 : 30),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE0F7FA),
                Color(0xFFB2EBF2),
              ],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFF1a2a6c), width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isDesktop ? 150 : isTablet ? 120 : 100,
                height: isDesktop ? 150 : isTablet ? 120 : 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1a2a6c), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/aang_smiling.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Container(
                      color: const Color(0xFFE0F7FA),
                      child: Icon(Icons.face, 
                          size: isDesktop ? 80 : isTablet ? 60 : 40, 
                          color: const Color(0xFF1a2a6c)),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: isMobile ? 15 : 20),
              
              Text(
                'Welcome, Math Bender!',
                style: TextStyle(
                  fontSize: isDesktop ? 28 : isTablet ? 24 : 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1a2a6c),
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isMobile ? 15 : 20),
              
              Container(
                padding: EdgeInsets.all(isMobile ? 15 : 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF8B4513), width: 2),
                ),
                child: Text(
                  'I\'m Aang, the Avatar! Master the elements of mathematics by solving multiplication problems. '
                  'Choose your grade level and prove your skills to become a true Math Master!\n\n'
                  '• Solve 10 problems per level\n'
                  '• Advance through 20 grades\n'
                  '• Balance all four elements of math!',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    color: const Color(0xFF1a2a6c),
                    fontFamily: 'Roboto',
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: isMobile ? 20 : 25),
              
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showWelcomeDialog = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFb21f1f),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 30 : 40,
                    vertical: isMobile ? 12 : 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'LET\'S BEGIN!',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grade Selection Screen
class GradeSelectionScreen extends StatelessWidget {
  const GradeSelectionScreen({super.key});

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;
    final isDesktop = screenSize.width >= 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a2a6c),
              Color(0xFFb21f1f),
              Color(0xFFfdbb2d),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 15 : 20,
                horizontal: isMobile ? 20 : 30,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1a2a6c),
                    Color(0xFFb21f1f),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: isMobile 
                  ? _buildMobileHeader(isMobile, context)
                  : _buildDesktopHeader(isDesktop, isTablet, context),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 16 : 30),
                child: Center(
                  child: SizedBox(
                    width: isDesktop ? 1200 : isTablet ? 800 : screenSize.width * 0.95,
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isDesktop ? 5 : isTablet ? 4 : 3,
                            crossAxisSpacing: isMobile ? 12 : 20,
                            mainAxisSpacing: isMobile ? 12 : 20,
                            childAspectRatio: isMobile ? 0.9 : 1.2,
                          ),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            final grade = index + 1;
                            final elementColor = _getElementColor(grade);
                            final elementImage = _getElementImage(grade);
                            
                            return _buildGradeCard(
                              grade,
                              elementColor,
                              elementImage,
                              context,
                              isMobile,
                              isTablet,
                              isDesktop,
                            );
                          },
                        ),

                        SizedBox(height: isMobile ? 20 : 40),

                        Container(
                          width: isDesktop ? 120 : isTablet ? 100 : 80,
                          height: isDesktop ? 120 : isTablet ? 100 : 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/momo.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, st) => Container(
                                color: const Color(0xFF8B4513),
                                child: Icon(Icons.airline_seat_legroom_extra, 
                                    size: isDesktop ? 50 : isTablet ? 40 : 30, 
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHeader(bool isMobile, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/appa.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, err, st) => Container(
                    color: const Color(0xFF8B4513),
                    child: const Icon(Icons.pets, size: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'CHOOSE YOUR PATH',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Select Your Grade Level',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Main Menu Button for mobile
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8B4513).withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B4513),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.home, color: Colors.white, size: 14),
            label: const Text(
              'MAIN MENU',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: _openWebsite,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1a2a6c),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 16),
            label: const Text(
              'EXIT TO GAMIFY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopHeader(bool isDesktop, bool isTablet, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: isDesktop ? 80 : 60,
          height: isDesktop ? 80 : 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/appa.jpg',
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                color: const Color(0xFF8B4513),
                child: Icon(Icons.pets, 
                    size: isDesktop ? 40 : 30, 
                    color: Colors.white),
              ),
            ),
          ),
        ),

        Column(
          children: [
            Text(
              'CHOOSE YOUR PATH',
              style: TextStyle(
                fontSize: isDesktop ? 32 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
                letterSpacing: 2,
              ),
            ),
            Text(
              'Select Your Grade Level',
              style: TextStyle(
                fontSize: isDesktop ? 18 : 14,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),

        // Main Menu and Exit Buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main Menu Button
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B4513).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B4513),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 16 : 12,
                    vertical: isDesktop ? 10 : 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: Icon(Icons.home, 
                    color: Colors.white, 
                    size: isDesktop ? 18 : 14),
                label: Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: isDesktop ? 12 : 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),

            // Existing Exit Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: _openWebsite,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1a2a6c),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 20 : 16,
                    vertical: isDesktop ? 12 : 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: Icon(Icons.exit_to_app, 
                    color: Colors.white, 
                    size: isDesktop ? 20 : 16),
                label: Text(
                  'EXIT',
                  style: TextStyle(
                    fontSize: isDesktop ? 14 : 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Color _getElementColor(int grade) {
    if (grade <= 5) return const Color(0xFF1a2a6c);
    if (grade <= 10) return const Color(0xFFb21f1f);
    if (grade <= 15) return const Color(0xFF8B4513);
    return const Color(0xFFfdbb2d);
  }

  String _getElementImage(int grade) {
    if (grade <= 5) return 'assets/water_badge.jpg';
    if (grade <= 10) return 'assets/fire_badge.jpg';
    if (grade <= 15) return 'assets/earth_badge.jpg';
    return 'assets/air_badge.jpg';
  }

  Widget _buildGradeCard(int grade, Color elementColor, String elementImage, 
                         BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GamePage(startingGrade: grade)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              elementColor.withOpacity(0.8),
              elementColor.withOpacity(0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: elementColor.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Stack(
          children: [
            Positioned(
              top: isMobile ? 5 : 10,
              right: isMobile ? 5 : 10,
              child: Container(
                width: isDesktop ? 40 : isTablet ? 35 : 30,
                height: isDesktop ? 40 : isTablet ? 35 : 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.9),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    elementImage,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Icon(
                      Icons.ac_unit,
                      size: isDesktop ? 20 : isTablet ? 18 : 15,
                      color: elementColor,
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GRADE',
                    style: TextStyle(
                      fontSize: isDesktop ? 14 : isTablet ? 12 : 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    '$grade',
                    style: TextStyle(
                      fontSize: isDesktop ? 36 : isTablet ? 32 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      shadows: [
                        const Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _getElementName(grade),
                    style: TextStyle(
                      fontSize: isDesktop ? 12 : isTablet ? 11 : 10,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getElementName(int grade) {
    if (grade <= 5) return 'WATER';
    if (grade <= 10) return 'FIRE';
    if (grade <= 15) return 'EARTH';
    return 'AIR';
  }
}

// Game Page - YOUR ORIGINAL LOGIC WITH AVATAR THEME
class GamePage extends StatefulWidget {
  final int startingGrade;

  const GamePage({super.key, required this.startingGrade});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  // YOUR ORIGINAL GAME VARIABLES - UNCHANGED
  final Random _random = Random();
  int num1 = 1;
  int num2 = 1;
  int grade = 1;
  int questionCount = 0;
  int correctCount = 0;
  int wrongCount = 0;
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String feedback = "";

  int timeLeft = 10;
  Timer? _timer;
  bool isTimeUp = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  void initState() {
    super.initState();
    grade = widget.startingGrade;
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _generateQuestion();
  }

  void _generateQuestion() {
    // YOUR ORIGINAL QUESTION GENERATION LOGIC - UNCHANGED
    switch (grade) {
      case 1:
        num1 = _random.nextInt(5) + 1;
        num2 = _random.nextInt(5) + 1;
        break;
      case 2:
        num1 = _random.nextInt(9) + 1;
        num2 = _random.nextInt(9) + 1;
        break;
      case 3:
        num1 = _random.nextInt(8) + 2;
        num2 = _random.nextInt(8) + 2;
        break;
      case 4:
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(8) + 2;
        break;
      case 5:
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(10) + 10;
        break;
      case 6:
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(8) + 2;
        break;
      case 7:
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(10) + 10;
        break;
      case 8:
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(10) + 10;
        break;
      case 9:
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(30) + 20;
        break;
      case 10:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(8) + 2;
        break;
      case 11:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(10) + 10;
        break;
      case 12:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(30) + 20;
        break;
      case 13:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(50) + 50;
        break;
      case 14:
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(90) + 10;
        break;
      case 15:
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(900) + 100;
        break;
      case 16:
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(900) + 100;
        break;
      case 17:
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 18:
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 19:
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(3000) + 2000;
        break;
      case 20:
        num1 = _random.nextInt(5000) + 5000;
        num2 = _random.nextInt(5000) + 5000;
        break;
      default:
        num1 = _random.nextInt(5) + 1;
        num2 = _random.nextInt(5) + 1;
    }
    _answerController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _focusNode.requestFocus();
    });
    _startTimer();
  }

  void _checkAnswer() {
    if (_answerController.text.isEmpty || isTimeUp) return;
    _timer?.cancel();
    int userAnswer = int.tryParse(_answerController.text) ?? 0;
    int correctAnswer = num1 * num2;

    setState(() {
      questionCount++;
      if (userAnswer == correctAnswer) {
        correctCount++;
        feedback = "✅ CORRECT!";
      } else {
        wrongCount++;
        feedback = "❌ WRONG! Answer: $correctAnswer";
      }

      if (questionCount == 10) {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) _showLevelResult();
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            _generateQuestion();
          }
        });
      }
    });
  }

  void _showLevelResult() async {
    // YOUR ORIGINAL LEVEL RESULT LOGIC - UNCHANGED
    String resultMsg;
    String resultEmoji;
    Color resultColor;
    String avatarImage;

    if (correctCount >= 7 && grade < 20) {
      grade++;
      resultMsg = "AWESOME! You advance to Grade $grade!";
      resultEmoji = "🎉";
      resultColor = const Color(0xFFfdbb2d);
      avatarImage = 'assets/aang_correct.jpg';
    } else if (correctCount < 4 && grade > 1) {
      grade--;
      resultMsg = "Keep practicing! You return to Grade $grade.";
      resultEmoji = "💪";
      resultColor = const Color(0xFFb21f1f);
      avatarImage = 'assets/aang_wrong.jpg';
    } else if (grade == 20) {
      resultMsg = "LEGENDARY! You've mastered all grades!";
      resultEmoji = "🏆";
      resultColor = const Color(0xFF1a2a6c);
      avatarImage = 'assets/aang_correct.jpg';
    } else {
      resultMsg = "Good effort! You stay at Grade $grade.";
      resultEmoji = "⭐";
      resultColor = const Color(0xFF8B4513);
      avatarImage = correctCount >= 5 ? 'assets/aang_correct.jpg' : 'assets/aang_wrong.jpg';
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, resultColor.withOpacity(0.2)],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: resultColor, width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar image instead of SpongeBob
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: resultColor, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: resultColor.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    avatarImage,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Icon(
                      correctCount >= 7 ? Icons.emoji_emotions : Icons.sentiment_dissatisfied,
                      size: 60,
                      color: resultColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                resultEmoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                "LEVEL COMPLETE",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem("✅ Correct", correctCount, Colors.green),
                        _buildStatItem("❌ Wrong", wrongCount, Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Main Menu Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B4513),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.home, size: 16, color: Colors.white),
                    label: const Text(
                      'MENU',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Exit Button
                  ElevatedButton.icon(
                    onPressed: _openWebsite,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade500,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.exit_to_app, size: 16, color: Colors.white),
                    label: const Text(
                      'EXIT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        questionCount = 0;
                        correctCount = 0;
                        wrongCount = 0;
                        feedback = "";
                        _generateQuestion();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFb21f1f),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  void _resetGame() {
    _timer?.cancel();
    setState(() {
      grade = widget.startingGrade;
      questionCount = 0;
      correctCount = 0;
      wrongCount = 0;
      feedback = "";
      _generateQuestion();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    timeLeft = _getTimeLimit();
    isTimeUp = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          isTimeUp = true;
          wrongCount++;
          feedback = "⏰ TIME'S UP! Answer: ${num1 * num2}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            if (questionCount == 10) {
              _showLevelResult();
            } else {
              _generateQuestion();
            }
          }
        });
      }
    });
  }

  int _getTimeLimit() {
    if (grade <= 5) return 10;
    if (grade <= 10) return 15;
    if (grade <= 15) return 20;
    return 25;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a2a6c),
              Color(0xFFb21f1f),
              Color(0xFFfdbb2d),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Avatar-themed header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 12 : 15,
                  horizontal: isMobile ? 16 : 20,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1a2a6c),
                      Color(0xFFb21f1f),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: isMobile 
                    ? _buildGameMobileHeader(isMobile)
                    : _buildGameDesktopHeader(isTablet),
              ),

              // Info Bar - Avatar themed
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 8 : 12,
                  horizontal: 12,
                ),
                color: const Color(0xFF1a2a6c).withOpacity(0.3),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip('GRADE', '$grade', const Color(0xFFb21f1f), isMobile),
                    _buildInfoChip('Q', '${questionCount + 1}/10', const Color(0xFF1a2a6c), isMobile),
                    _buildInfoChip('✅', '$correctCount', Colors.green, isMobile),
                    _buildInfoChip('❌', '$wrongCount', Colors.red, isMobile),
                  ],
                ),
              ),

              // Main Game Content - YOUR ORIGINAL UI WITH AVATAR THEME
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: Center(
                    child: Container(
                      width: isMobile ? screenSize.width * 0.95 : 600,
                      margin: const EdgeInsets.all(16),
                      padding: EdgeInsets.all(isMobile ? 20 : 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFfdbb2d).withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: const Color(0xFFfdbb2d), width: 4),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Timer - Avatar themed
                          ScaleTransition(
                            scale: timeLeft <= 3
                                ? _pulseAnimation
                                : const AlwaysStoppedAnimation(1.0),
                            child: Container(
                              padding: EdgeInsets.all(isMobile ? 12 : 18),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: timeLeft <= 3
                                      ? [Colors.red, Colors.red.shade900]
                                      : [Color(0xFF1a2a6c), Color(0xFFb21f1f)],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (timeLeft <= 3 ? Colors.red : Color(0xFF1a2a6c))
                                        .withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: isMobile ? 30 : 40,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '$timeLeft',
                                    style: TextStyle(
                                      fontSize: isMobile ? 28 : 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'sec',
                                    style: TextStyle(
                                      fontSize: isMobile ? 10 : 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Question - Avatar themed
                          Container(
                            padding: EdgeInsets.all(isMobile ? 16 : 20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFfdbb2d), Color(0xFFb21f1f)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFF8B4513), width: 3),
                            ),
                            child: Text(
                              '$num1 × $num2 = ?',
                              style: TextStyle(
                                fontSize: isMobile ? 36 : 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Feedback
                          if (feedback.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(isMobile ? 12 : 16),
                              margin: EdgeInsets.only(bottom: isMobile ? 10 : 15),
                              decoration: BoxDecoration(
                                color: feedback.contains("CORRECT") 
                                    ? Colors.green.shade100 
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: feedback.contains("CORRECT") 
                                      ? Colors.green 
                                      : Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                feedback,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: feedback.contains("CORRECT") 
                                      ? Colors.green.shade800 
                                      : Colors.red.shade800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                          // Answer Input
                          Container(
                            width: isMobile ? 180 : 220,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFfdbb2d).withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              key: const Key('answerField'),
                              controller: _answerController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isMobile ? 24 : 32,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                labelStyle: const TextStyle(color: Color(0xFF8B4513)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFFfdbb2d), width: 3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFFfdbb2d), width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Color(0xFFb21f1f), width: 3),
                                ),
                              ),
                              onSubmitted: (_) => _checkAnswer(),
                            ),
                          ),

                          SizedBox(height: isMobile ? 20 : 30),

                          // Submit Button - Avatar themed
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _checkAnswer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 40 : 60,
                                  vertical: isMobile ? 16 : 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: isMobile ? 24 : 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: isMobile ? 8 : 12),
                                  Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                      fontSize: isMobile ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isMobile ? 10 : 15),

                          // Reset, Main Menu and Exit Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: _resetGame,
                                child: Text(
                                  'Reset Game',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF1a2a6c),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                                  );
                                },
                                child: Text(
                                  'Main Menu',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF8B4513),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: _openWebsite,
                                child: Text(
                                  'Exit to Gamify',
                                  style: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFFb21f1f),
                                    fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }

  Widget _buildGameMobileHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Main Menu Button
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
          icon: const Icon(Icons.home, color: Colors.white, size: 20),
        ),
        
        // Element badge and title
        Expanded(
          child: Column(
            children: [
              Text(
                'AVATAR MATH',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                'Grade $grade',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        
        // Exit button
        IconButton(
          onPressed: _openWebsite,
          icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 20),
        ),
      ],
    );
  }
  
  Widget _buildGameDesktopHeader(bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Main Menu Button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
          ),
          icon: const Icon(Icons.home, size: 16, color: Colors.white),
          label: const Text('MENU'),
        ),
        
        // Element badge
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              _getElementImage(grade),
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                color: _getElementColor(grade),
                child: const Icon(Icons.ac_unit, color: Colors.white),
              ),
            ),
          ),
        ),
        
        // Title
        Column(
          children: [
            Text(
              'AVATAR MATH MASTERS',
              style: TextStyle(
                fontSize: isTablet ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'Grade $grade • ${_getElementName(grade)}',
              style: TextStyle(
                fontSize: isTablet ? 14 : 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        
        // Exit button
        ElevatedButton.icon(
          onPressed: _openWebsite,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1a2a6c),
          ),
          icon: const Icon(Icons.exit_to_app, size: 16, color: Colors.white),
          label: const Text('EXIT'),
        ),
      ],
    );
  }

  Widget _buildInfoChip(String label, String value, Color color, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Color _getElementColor(int grade) {
    if (grade <= 5) return const Color(0xFF1a2a6c);
    if (grade <= 10) return const Color(0xFFb21f1f);
    if (grade <= 15) return const Color(0xFF8B4513);
    return const Color(0xFFfdbb2d);
  }

  String _getElementImage(int grade) {
    if (grade <= 5) return 'assets/water_badge.jpg';
    if (grade <= 10) return 'assets/fire_badge.jpg';
    if (grade <= 15) return 'assets/earth_badge.jpg';
    return 'assets/air_badge.jpg';
  }

  String _getElementName(int grade) {
    if (grade <= 5) return 'WATER';
    if (grade <= 10) return 'FIRE';
    if (grade <= 15) return 'EARTH';
    return 'AIR';
  }
}