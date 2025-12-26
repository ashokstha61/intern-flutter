import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/features/auth/state/auth_notifiers.dart';
import 'beam_locations/home_location.dart';
import 'beam_locations/list_location.dart';
import 'beam_locations/auth_location.dart';

// Create a simple provider for BeamerDelegate without family
final appRouterProvider = Provider<BeamerDelegate>((ref) {
  return BeamerDelegate(
    initialPath: '/login',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        AuthLocation(),
        HomeLocation(),
        ListLocation(),
      ],
    ),
  );
});

// Alternative: Create a provider that checks auth and returns appropriate delegate
final authAwareRouterProvider = Provider<BeamerDelegate>((ref) {
  // Listen to auth state changes
  final authState = ref.watch(authProvider);
  
  return BeamerDelegate(
    initialPath: authState.isAuthenticated ? '/home' : '/login',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        AuthLocation(),
        HomeLocation(),
        ListLocation(),
      ],
    ),
    guards: [
      // Define auth guard logic here
      BeamGuard(
        pathPatterns: ['/home', '/counter', '/api-demo', '/add-item', '/list*'],
        check: (context, state) {
          return authState.isAuthenticated;
        },
        beamToNamed: (context, from) => '/login',
      ),
    ],
  );
});