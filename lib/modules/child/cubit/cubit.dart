import 'package:bloc/bloc.dart';
import 'package:elshaima/models/elshaima_app/child_model.dart';
import 'package:elshaima/modules/child/cubit/statas.dart';
import 'package:elshaima/shared/network/end_points.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';
import 'package:elshaima/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ElshaimaChildCubit extends Cubit<ElshaimaChildStates> {
  ElshaimaChildCubit() : super(ElshaimaChildInitialState());
  static ElshaimaChildCubit get(context) => BlocProvider.of(context);

  ElshaimaChildModel elshaimaChildModel;
  void getChildData() {
    emit(ElshaimaChildLoadingState());
    DioHelper.getData(url: GETCHILD, token:CacheHelper.getData(key: "token"))
        .then((value) {
      elshaimaChildModel = ElshaimaChildModel.fromJson(value.data);

      print(value.data);

      emit(ElshaimaChildSsuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ElshaimaChildErrorState(error.toString()));
    });
  }
}
