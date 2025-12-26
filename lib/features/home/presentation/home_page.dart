import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectintern/features/home/presentation/widgets/taskcard.dart';
import '../../../core/widgets/custom_button.dart';
import 'package:beamer/beamer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Internship'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.moon),
            onPressed: () {
              // TODO: Toggle theme
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            FontAwesomeIcons.userGraduate,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome, Intern!',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '7-Day Flutter Intensive Program',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const LinearProgressIndicator(
                      value: 0.14, // Day 1/7
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Day 1 of 7 completed',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Daily Tasks',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildTaskCard(
                    context,
                    day: 1,
                    title: 'Project Setup & Architecture',
                    description:
                        'Set up project structure and understand architecture',
                    completed: true,
                    icon: FontAwesomeIcons.layerGroup,
                  ),
                  buildTaskCard(
                    context,
                    day: 2,
                    title: 'Riverpod Fundamentals',
                    description:
                        'Learn Provider, StateProvider, FutureProvider',
                    completed: false,
                    icon: FontAwesomeIcons.gears,
                  ),
                  buildTaskCard(
                    context,
                    day: 3,
                    title: 'Advanced State & Async',
                    description: 'Handle async operations with FutureProvider',
                    completed: false,
                    icon: FontAwesomeIcons.arrowsRotate,
                  ),
                  buildTaskCard(
                    context,
                    day: 4,
                    title: 'Beamer Routing',
                    description: 'Implement declarative navigation',
                    completed: false,
                    icon: FontAwesomeIcons.route,
                  ),
                  buildTaskCard(
                    context,
                    day: 5,
                    title: 'Riverpod + Beamer',
                    description: 'Integrate state management with routing',
                    completed: false,
                    icon: FontAwesomeIcons.link,
                  ),
                  buildTaskCard(
                    context,
                    day: 6,
                    title: 'Forms & Validation',
                    description: 'Create forms with Riverpod state',
                    completed: false,
                    icon: FontAwesomeIcons.penToSquare,
                  ),
                  buildTaskCard(
                    context,
                    day: 7,
                    title: 'Optimization & Testing',
                    description: 'Optimize rebuilds and write tests',
                    completed: false,
                    icon: FontAwesomeIcons.vial,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Start Next Task',
                    onPressed: () {
                      Beamer.of(context).beamToNamed('/counter');
                    },

                    icon: FontAwesomeIcons.play,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
