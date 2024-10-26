part of 'splash_bloc.dart';

@immutable
sealed class SplashState extends Equatable {
  const SplashState();


  @override
  List<Object> get props => [];
}

final class DisplaySplashState extends SplashState {}

final class HomeState extends SplashState {}

final class AuthenticatedState extends SplashState {}

final class UnAuthenticatedState extends SplashState {}
