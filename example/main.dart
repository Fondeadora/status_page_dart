import 'package:flutter/material.dart';
import 'package:status_page_dart/status_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final statusPage = StatusPage(apiKey: 'YOUR_API_KEY');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Status Page Example'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                'The  component status is: ',
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final page = await statusPage.page('PAGE_ID');
                    print(page.name);
                  } catch (e) {
                    print('Something went wrong');
                  }
                },
                child: const Text(
                  'Get Status',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
