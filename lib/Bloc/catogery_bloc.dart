import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Api/CatogeryApi.dart';
import 'package:bloc_demo/Model/CatogeryModel.dart';
import 'package:meta/meta.dart';

part 'catogery_event.dart';
part 'catogery_state.dart';

class CatogeryBloc extends Bloc<CatogeryEvent, CatogeryState> {

  CatogeryApi catogeryApi = CatogeryApi();
 late  CatogeryModel catogeryModel;

  CatogeryBloc() : super(CatogeryInitial()) {
    on<getPlayers>((event, emit) =>getPlayer(event,emit));
  }
  void getPlayer(CatogeryEvent catogeryEvent,Emitter <CatogeryState>emit) async {
    emit(CatogeryLoading());
  try{
    catogeryModel =await catogeryApi.Player();
   emit(CatogeryLoaded());
  }catch(e){
    emit(CatogeryError());
    print("error>>>>>>>>>>>>>"+e.toString());
  }
  }
}

