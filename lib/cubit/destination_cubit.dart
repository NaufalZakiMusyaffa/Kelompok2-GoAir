import 'package:goair/models/destination_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goair/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {

    try {
      emit(DestinationLoading());

      List<DestinationModel> destinations = await DestinationServices().fetchDestinations();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}