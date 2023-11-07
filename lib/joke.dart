import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'joke.g.dart';

@riverpod
class Joke extends _$Joke {
  @override
  FutureOr<String> build() => "I am a Joke";

  FutureOr<void> loadJoke() async {
    state = AsyncLoading();
    await Future.delayed(Duration(seconds: 3));
    state = AsyncValue.error("Error Occured",StackTrace.current);
  }
}
