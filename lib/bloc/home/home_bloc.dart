import 'package:bloc/bloc.dart';
import 'package:mobile_shop/bloc/home/home_event.dart';
import 'package:mobile_shop/bloc/home/home_state.dart';
import 'package:mobile_shop/data/repository/banner_repository.dart';
import 'package:mobile_shop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitializedData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanner();
      emit(HomeRequestSuccesState(bannerList));
    });
  }
}
