import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'check_connection_state.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState> {
  CheckConnectionCubit() : super(CheckConnectionInitial()) {
    checkInitialConnectivity();
    monitorConnectivityChanges();
  }

  void checkInitialConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    emitConnectivityState(connectivityResult.first);
  }

  void monitorConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) {
      emitConnectivityState(connectivityResult.first);
    });
  }

  void emitConnectivityState(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(CheckConnectionNoInternet());
    } else {
      emit(CheckConnectionHasInternet());
    }
  }
}
