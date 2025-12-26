import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/login_page.dart';

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/login'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('login'),
        title: 'Login',
        child: LoginPage(),
      ),
    ];
  }
}