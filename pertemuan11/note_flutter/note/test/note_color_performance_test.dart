import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/note.dart';

Color noteColorByDeadlineOptimized(DateTime? deadline, DateTime today) {
  if (deadline == null) return Colors.yellow.shade300;

  final dl = DateTime(deadline.year, deadline.month, deadline.day);
  final diffDay = dl.difference(today).inDays;

  if (diffDay < 0) return Colors.red.shade900;
  if (diffDay <= 1) return Colors.red.shade400;
  if (diffDay <= 3) return Colors.orange.shade400;
  if (diffDay <= 7) return Colors.yellow.shade400;
  return Colors.green.shade400;
}

void main() {
  test('noteColorByDeadlineOptimized returns correct color', () {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final deadlines = List<DateTime?>.generate(200000, (i) {
      if (i % 10 == 0) return null;
      return today.add(Duration(days: (i % 30) - 10));
    });

    final swOriginal = Stopwatch()..start();
    for (final d in deadlines) {
      noteColorByDeadlineOptimized(d, today);
    }
    swOriginal.stop();

    final swOptimized = Stopwatch()..start();
    for (final d in deadlines) {
      noteColorByDeadlineOptimized(d, today);
    }
    swOptimized.stop();
    print('Original ms: ${swOriginal.elapsedMilliseconds}');
    print('Optimized ms: ${swOptimized.elapsedMilliseconds}');
    expect(noteColorByDeadline(null), Colors.yellow.shade300);
  });
}

