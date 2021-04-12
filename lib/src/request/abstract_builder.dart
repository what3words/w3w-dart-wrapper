import '../service/what3words_v3.dart';

abstract class AbstractBuilder<T> {
  late What3WordsV3 api;

  AbstractBuilder(What3WordsV3 api) {
    this.api = api;
  }

  T execute();
}
