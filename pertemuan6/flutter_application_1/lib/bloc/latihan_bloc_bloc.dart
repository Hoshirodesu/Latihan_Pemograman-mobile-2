import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'latihan_bloc_event.dart';
part 'latihan_bloc_state.dart';

class LatihanBlocBloc extends Bloc<LatihanBlocEvent, LatihanBlocState> {
  LatihanBlocBloc() : super(LatihanBlocInitial()) {
    on<LatihanBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
