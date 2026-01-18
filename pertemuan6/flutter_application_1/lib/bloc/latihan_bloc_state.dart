part of 'latihan_bloc_bloc.dart';

@immutable
sealed class LatihanBlocState extends Equatable {
  const LatihanBlocState();

  @override
  List<Object> get props => [];
}

final class LatihanBlocInitial extends LatihanBlocState {
  final int counter;

  const LatihanBlocInitial(this.counter);

  @override
  List<Object> get props => [counter];
}
