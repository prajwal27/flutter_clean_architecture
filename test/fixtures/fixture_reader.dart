import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
// need to run as 'flutter test test'