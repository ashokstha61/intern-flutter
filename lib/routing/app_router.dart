import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/features/auth/state/auth_notifiers.dart';
import 'package:projectintern/routing/beam_locations/posts_location.dart';
import 'beam_locations/home_location.dart';
import 'beam_locations/list_location.dart';
import 'beam_locations/auth_location.dart';

final appRouterProvider = Provider<BeamerDelegate>((ref) {
  return BeamerDelegate(
    initialPath: '/login',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        AuthLocation(),
        HomeLocation(),
        ListLocation(),
        PostsLocation(),
      ],
    ),
  );
});

final authAwareRouterProvider = Provider<BeamerDelegate>((ref) {
  final authState = ref.watch(authProvider);

  return BeamerDelegate(
    initialPath: authState.isAuthenticated ? '/home' : '/login',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [AuthLocation(), HomeLocation(), ListLocation()],
    ),
    guards: [
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
