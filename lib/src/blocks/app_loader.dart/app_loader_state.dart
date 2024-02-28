import 'package:equatable/equatable.dart';

sealed class AppLoaderState extends Equatable {
  const AppLoaderState();

  @override
  List<Object?> get props => [];
}

final class AppLoaderStateLoading extends AppLoaderState {}

final class AppLoaderStateReady extends AppLoaderState {
  const AppLoaderStateReady(this.settings);

  final Map<String, dynamic> settings;

  @override
  List<Object?> get props => [settings];
}
