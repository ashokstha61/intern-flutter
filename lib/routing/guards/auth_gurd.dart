import 'package:beamer/beamer.dart';

// Simple BeamGuard without WidgetRef dependency
class AuthGuard extends BeamGuard {
  final bool isAuthenticated;

  AuthGuard(this.isAuthenticated)
    : super(
        pathPatterns: ['/home', '/counter', '/api-demo', '/add-item', '/list*'],
        check: (context, state) => isAuthenticated,
        beamToNamed: (context, from) => '/login',
      );
}