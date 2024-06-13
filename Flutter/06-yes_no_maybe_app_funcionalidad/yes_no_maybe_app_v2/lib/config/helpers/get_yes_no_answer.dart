
import 'package:dio/dio.dart';
import 'package:yes_no_maybe_app_v2/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

class GetYesNoAnswer{
  final _dio = Dio();

  Future<Message> getAnswer() async{      //METODO PARA GENERAR LA RESPUESTA
    final response = await _dio.get('https://yesno.wtf/api' ); //LINK DEL GIF DE YES NO
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity(); //REGRESAMOS UN SI O UN NO, DEL YESNOMODEL
  }
}