import 'dart:async';
import 'dart:io';
import 'package:build/build.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:path_provider/path_provider.dart';

class ListBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;
    final content = await buildStep.readAsString(inputId);
    final numbers = content.split(' ');

    final sb = StringBuffer()..write('const [ ');
    for (var number in numbers) {
      sb.write('$number ,');
    }
    sb.write('];');

    final outputId = inputId.changeExtension('.dart');
    await buildStep.writeAsString(outputId, sb.toString());
  }

  @override
  // TODO: implement buildExtensions
  Map<String, List<String>> get buildExtensions => {
        '.txt': ['.dart']
      };
}

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          _write();
        }),
      ),
    );
  }
}

Future<void> _write() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/my_file.txt');
  await file.writeAsString('[1, 3, 5]');
}
