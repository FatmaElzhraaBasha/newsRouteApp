import '../../../model/SourceResponse.dart';

abstract class SourcesState {}

class SourceLoadingState extends SourcesState {}

class SourceSuccessState extends SourcesState {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}

class SourceErrorState extends SourcesState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}
