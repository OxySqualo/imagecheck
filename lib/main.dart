import 'package:flutter/material.dart';
import 'package:imagecheck/screens/home_screen.dart';

import 'data/roote.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      ),
    );
