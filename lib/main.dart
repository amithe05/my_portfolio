import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class _Theme {
  static const Color backgroundColor = Color(0xFF0D0B1A);
  static const Color cardColor = Color(0xFF1E1C2B);
  static const Color headlineColor1 = Color(0xFF9F7CE0);
  static const Color headlineColor2 = Color(0xFF5E8BFF);
  static const Color accentColor = Color(0xFF67B0FF);
  static const Color textColor = Color(0xFF9CA3AF);
  static const Color skillColor1 = Color(0xFF9F7CE0);
  static const Color skillColor2 = Color(0xFF5E8BFF);
  static const Color devProcessIcon = Color(0xFFC7E2FF);
  static const Color devProcessBackground = Color(0xFF181524);
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amith Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: _Theme.backgroundColor,
        cardColor: _Theme.cardColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme.copyWith(
                bodyLarge: const TextStyle(color: _Theme.textColor),
                bodyMedium: const TextStyle(color: _Theme.textColor),
                headlineLarge: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                headlineMedium: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('amith.'),
        centerTitle: false,
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            const Text('Hi, I\'m', style: TextStyle(color: _Theme.textColor)),
            const SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [_Theme.headlineColor1, _Theme.headlineColor2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: Text(
                'Amith',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mobile App Developer',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Crafting exceptional mobile experiences with Android Native, React Native, and Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(color: _Theme.textColor),
              ),
            ),
            const SizedBox(height: 40),
            // Stats Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                StatCard(
                  icon: Icons.article_outlined,
                  value: '2+',
                  label: 'Apps Published',
                ),
                StatCard(
                  icon: Icons.cloud_download_outlined,
                  value: '1M+',
                  label: 'Total Downloads',
                ),
                StatCard(
                  icon: Icons.star_border,
                  value: '4.5',
                  label: 'App Rating',
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Featured Apps Section
            const Text(
              'Featured Apps',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
            const SizedBox(height: 15),
            const FeaturedAppsSection()
                .animate()
                .fadeIn(delay: 600.ms, duration: 800.ms),
            const SizedBox(height: 60),

            // Development Process Section
            const Text(
              'Development Process',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
            const SizedBox(height: 8),
            const Text(
              'A systematic approach to building exceptional mobile applications',
              textAlign: TextAlign.center,
              style: TextStyle(color: _Theme.textColor),
            ).animate().fadeIn(delay: 600.ms, duration: 800.ms),
            const SizedBox(height: 40),
            DevelopmentProcessSection()
                .animate()
                .fadeIn(delay: 700.ms, duration: 800.ms),
            const SizedBox(height: 60),

            // Contact Section
            const Text(
              'Let\'s Create Amazing Mobile Experiences',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: _Theme.headlineColor1,
              ),
            ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
            const SizedBox(height: 16),
            const Text(
              'Ready to bring your mobile app idea to life? I specialize in creating polished, user-friendly mobile applications that deliver exceptional experiences.',
              textAlign: TextAlign.center,
              style: TextStyle(color: _Theme.textColor),
            ).animate().fadeIn(delay: 600.ms, duration: 800.ms),
            const SizedBox(height: 16),
            const LocationInfo(location: 'Chennai, India')
                .animate()
                .fadeIn(delay: 700.ms, duration: 800.ms),
            const SizedBox(height: 40),
            ContactFormSection()
                .animate()
                .fadeIn(delay: 800.ms, duration: 800.ms),
          ],
        ),
      ),
    );
  }
}

// Reusable Widgets
class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 28, color: _Theme.accentColor),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: _Theme.accentColor),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: _Theme.textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;

  const IconWithLabel({
    super.key,
    required this.icon,
    required this.label,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: _Theme.accentColor, size: size),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}

class SkillBar extends StatelessWidget {
  final String skill;
  final double percent;

  const SkillBar({
    super.key,
    required this.skill,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(skill,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 10,
              backgroundColor: Colors.grey.shade800,
              valueColor: const AlwaysStoppedAnimation<Color>(
                _Theme.accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedAppsSection extends StatelessWidget {
  const FeaturedAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FeaturedAppItem(
              icon: Icons.rocket_launch,
              title: 'VeloCT Onboarding',
              subtitle: 'Loan Onboarding application',
              isFeatured: true,
              technologies: ['Flutter', 'Firebase'],
              rating: '4.1',
              downloads: '5K+',
              platform: 'iOS & Android',
            ),
            SizedBox(width: 20),
            FeaturedAppItem(
              icon: Icons.attach_money,
              title: 'Ntelcare Family app',
              subtitle: 'Older person monitoring',
              isFeatured: false,
              technologies: ['Flutter', 'Dart', 'Firebase', 'IOT'],
              rating: '4.0',
              downloads: '3K+',
              platform: 'iOS & Android',
            ),
          ],
        ),
      ],
    );
  }
}

class FeaturedAppItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isFeatured;
  final List<String> technologies;
  final String rating;
  final String downloads;
  final String platform;

  const FeaturedAppItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isFeatured = false,
    required this.technologies,
    required this.rating,
    required this.downloads,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _Theme.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: _Theme.accentColor, size: 36),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(title,
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                children: technologies
                    .map((tech) => Chip(
                          label: Text(tech),
                          backgroundColor: _Theme.cardColor,
                          labelStyle: const TextStyle(
                              color: _Theme.textColor, fontSize: 10),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.star, color: _Theme.accentColor, size: 16),
                  const SizedBox(width: 4),
                  Text(rating, style: const TextStyle(color: Colors.white)),
                  const SizedBox(width: 16),
                  const Icon(Icons.cloud_download,
                      color: _Theme.textColor, size: 16),
                  const SizedBox(width: 4),
                  Text(downloads,
                      style: const TextStyle(color: _Theme.textColor)),
                  const SizedBox(width: 16),
                  const Icon(Icons.phone_android,
                      color: _Theme.textColor, size: 16),
                  const SizedBox(width: 4),
                  Text(platform,
                      style: const TextStyle(color: _Theme.textColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DevelopmentProcessSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ProcessCard(
          icon: Icons.lightbulb_outline,
          title: 'Ideation & Planning',
          steps: [
            'Requirements gathering and market research',
            'User flow and wireframe design',
            'Interactive prototype development',
          ],
        ),
        SizedBox(width: 20),
        ProcessCard(
          icon: Icons.code,
          title: 'Development',
          steps: [
            'Architecture setup and tech stack selection',
            'Agile development with regular sprints',
            'Continuous testing and code reviews',
          ],
        ),
        SizedBox(width: 20),
        ProcessCard(
          icon: Icons.rocket_launch,
          title: 'Launch & Growth',
          steps: [
            'App store optimization and submission',
            'Analytics integration and monitoring',
            'Regular updates and feature enhancements',
          ],
        ),
      ],
    );
  }
}

class ProcessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> steps;

  const ProcessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _Theme.devProcessBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: _Theme.devProcessIcon, size: 36),
              ),
              const SizedBox(height: 16),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              ...List.generate(
                steps.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${index + 1}.',
                          style: const TextStyle(color: _Theme.accentColor)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(steps[index],
                            style: const TextStyle(color: _Theme.textColor)),
                      ),
                    ],
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

class ContactFormSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 1000 ? 400 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextField('Name'),
            const SizedBox(height: 16),
            _buildTextField('Email'),
            const SizedBox(height: 16),
            _buildTextField('Message', maxLines: 4),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [_Theme.headlineColor2, _Theme.headlineColor1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Send Message',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                side: const BorderSide(color: _Theme.textColor, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('View Resume',
                  style: TextStyle(color: _Theme.textColor)),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _launchUrl("https://github.com/amithe05"),
                  child: Image.asset(
                    "github.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () => _launchUrl(
                      "https://www.linkedin.com/in/amith-e-103687234/"),
                  child: Image.asset(
                    "linkedin.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () => _launchUrl("https://x.com/amithe05"),
                  child: Image.asset(
                    "twitter.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: _Theme.textColor),
        filled: true,
        fillColor: _Theme.cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  final String location;

  const LocationInfo({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on_outlined,
            color: _Theme.textColor, size: 16),
        const SizedBox(width: 8),
        Text(location, style: const TextStyle(color: _Theme.textColor)),
      ],
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
