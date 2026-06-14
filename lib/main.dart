import 'package:flutter/material.dart';

void main() {
  runApp(const ExcelerateConnectApp());
}

class ExcelerateConnectApp extends StatelessWidget {
  const ExcelerateConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF102033),
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFE3E8EF)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD5DCE7)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD5DCE7)),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProgramListScreen.routeName: (_) => const ProgramListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProgramDetailsScreen.routeName) {
          final program = settings.arguments as Program;
          return MaterialPageRoute<void>(
            builder: (_) => ProgramDetailsScreen(program: program),
          );
        }
        return null;
      },
    );
  }
}

class Program {
  const Program({
    required this.title,
    required this.date,
    required this.topic,
    required this.description,
    required this.duration,
    required this.format,
  });

  final String title;
  final String date;
  final String topic;
  final String description;
  final String duration;
  final String format;
}

const programs = [
  Program(
    title: 'Career Accelerator Bootcamp',
    date: 'June 21, 2026',
    topic: 'Career Readiness',
    duration: '4 weeks',
    format: 'Live online',
    description:
        'Build a polished profile, practice interview stories, and learn how to present project work with confidence. The bootcamp includes mentor feedback, resume reviews, and weekly action plans.',
  ),
  Program(
    title: 'Data Analytics Sprint',
    date: 'July 3, 2026',
    topic: 'Analytics and Dashboards',
    duration: '10 days',
    format: 'Hybrid',
    description:
        'Work through a practical analytics case using spreadsheets, visualization, and stakeholder reporting. Participants finish with a dashboard and a short insight presentation.',
  ),
  Program(
    title: 'Product Innovation Lab',
    date: 'July 18, 2026',
    topic: 'Product Strategy',
    duration: '3 weeks',
    format: 'Team project',
    description:
        'Explore customer problems, prototype solutions, and convert ideas into a clear product pitch. The lab is designed for interns who want hands-on experience with discovery and delivery.',
  ),
  Program(
    title: 'Leadership Micro-Internship',
    date: 'August 5, 2026',
    topic: 'Leadership and Communication',
    duration: '2 weeks',
    format: 'Mentored cohort',
    description:
        'Practice professional communication, meeting ownership, and team coordination through guided challenges. Each participant receives mentor notes and a completion certificate.',
  ),
];

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.hub_outlined,
                    size: 56,
                    color: Color(0xFF2563EB),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Excelerate Connect',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF102033),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to discover programs, announcements, and internship resources.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF536173),
                        ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword
                            ? 'Show password'
                            : 'Hide password',
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: _login,
                    icon: const Icon(Icons.login),
                    label: const Text('Login'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _login,
                    icon: const Icon(Icons.person_add_alt_1_outlined),
                    label: const Text('Continue as guest'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _WelcomePanel(
            onBrowsePrograms: () {
              Navigator.of(context).pushNamed(ProgramListScreen.routeName);
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Announcements',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 12),
          const _AnnouncementTile(
            icon: Icons.campaign_outlined,
            title: 'New cohorts are open',
            message: 'Register early to reserve your seat in upcoming programs.',
          ),
          const SizedBox(height: 10),
          const _AnnouncementTile(
            icon: Icons.event_available_outlined,
            title: 'Mentor Q&A this week',
            message: 'Join the live session to ask questions about applications.',
          ),
          const SizedBox(height: 20),
          Text(
            'Quick Links',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: MediaQuery.sizeOf(context).width > 640 ? 4 : 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.35,
            children: [
              _QuickLinkTile(
                icon: Icons.school_outlined,
                label: 'Programs',
                onTap: () {
                  Navigator.of(context).pushNamed(ProgramListScreen.routeName);
                },
              ),
              const _QuickLinkTile(
                icon: Icons.assignment_outlined,
                label: 'Tasks',
              ),
              const _QuickLinkTile(
                icon: Icons.people_outline,
                label: 'Mentors',
              ),
              const _QuickLinkTile(
                icon: Icons.help_outline,
                label: 'Support',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WelcomePanel extends StatelessWidget {
  const _WelcomePanel({required this.onBrowsePrograms});

  final VoidCallback onBrowsePrograms;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF12385F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Track opportunities, review announcements, and find the right program for your next milestone.',
            style: TextStyle(color: Color(0xFFD9E7F7), height: 1.45),
          ),
          const SizedBox(height: 18),
          FilledButton.icon(
            onPressed: onBrowsePrograms,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF12385F),
              minimumSize: const Size(0, 48),
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Browse Programs'),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementTile extends StatelessWidget {
  const _AnnouncementTile({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(message),
      ),
    );
  }
}

class _QuickLinkTile extends StatelessWidget {
  const _QuickLinkTile({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  static const routeName = '/programs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: programs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final program = programs[index];
          return ProgramCard(program: program);
        },
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.program});

  final Program program;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).pushNamed(
            ProgramDetailsScreen.routeName,
            arguments: program,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      program.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _InfoChip(icon: Icons.calendar_today, label: program.date),
                  _InfoChip(icon: Icons.topic_outlined, label: program.topic),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgramDetailsScreen extends StatefulWidget {
  const ProgramDetailsScreen({super.key, required this.program});

  static const routeName = '/program-details';

  final Program program;

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  bool _registered = false;

  void _register() {
    setState(() {
      _registered = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registered for ${widget.program.title}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final program = widget.program;

    return Scaffold(
      appBar: AppBar(title: const Text('Program Details')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            program.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF102033),
                ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(icon: Icons.calendar_today, label: program.date),
              _InfoChip(icon: Icons.topic_outlined, label: program.topic),
              _InfoChip(icon: Icons.schedule, label: program.duration),
              _InfoChip(icon: Icons.language_outlined, label: program.format),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    program.description,
                    style: const TextStyle(
                      color: Color(0xFF4E5C6D),
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _registered ? null : _register,
            icon: Icon(_registered ? Icons.check_circle : Icons.app_registration),
            label: Text(_registered ? 'Registered' : 'Register Now'),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      side: const BorderSide(color: Color(0xFFD5DCE7)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
