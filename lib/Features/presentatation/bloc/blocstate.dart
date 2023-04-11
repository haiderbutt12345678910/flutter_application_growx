import 'package:equatable/equatable.dart';

abstract class BlocStates extends Equatable {
  const BlocStates();
}

class Initial extends BlocStates {
  @override
  List<Object?> get props => [];
}

class Sucessfull extends BlocStates {
  @override
  List<Object?> get props => [];
}

class Failure extends BlocStates {
  @override
  List<Object?> get props => [];
}

class Loading extends BlocStates {
  @override
  List<Object?> get props => [];
}
