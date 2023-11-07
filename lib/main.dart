import "package:clean_architecture/counter.dart";
import "package:clean_architecture/joke.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeState = ref.watch(jokeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Text(
                "-",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            Text(
              jokeState.when(
                data: (data) {
                  return data;
                },
                loading: () {
                  return "Loading Haha";
                },
                error: (error, stackTrace) {
                  print(error);
                  return "Error";
                },
              ),
              style: const TextStyle(fontSize: 40.0),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(jokeProvider.notifier).loadJoke();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
