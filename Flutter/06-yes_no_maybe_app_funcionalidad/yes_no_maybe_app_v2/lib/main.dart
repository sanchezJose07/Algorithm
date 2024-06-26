import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app_v2/config/theme/app_theme.dart';
import 'package:yes_no_maybe_app_v2/presentation/provider/chat_provider.dart';
import 'package:yes_no_maybe_app_v2/presentation/screens/chat/chat_screen.dart';


void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp( { super.key } );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider() )
      ]   ,
      child: MaterialApp(
        title: 'Yes No Maybe App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 6 ).theme(),
        home: const ChatScreen()
      ),
    );
  }
}