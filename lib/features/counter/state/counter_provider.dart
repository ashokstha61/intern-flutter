import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_notifier.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);