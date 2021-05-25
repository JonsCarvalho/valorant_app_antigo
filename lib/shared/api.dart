import 'package:dio/dio.dart';
import 'package:valorantapp/shared/constants.dart';

import 'models/agent_model.dart';

class Api {
  final Dio client = Dio(BaseOptions(baseUrl: BASE_URL));

  Future getAgents() async {
    Response result;

    try {
      result = await client.get('/agents');
    } catch (e) {
      print(e.message);
    }

    if (result.statusCode == 200) {
      List data = result.data['data'];

      List<AgentModel> agentModelList;

      agentModelList = data.map((agent) => AgentModel.fromJson(agent)).toList();

      for (int i = 0; i < agentModelList.length; i++) {
        if (agentModelList[i].fullPortrait == null) {
          agentModelList.removeAt(i);
        }
      }

      return agentModelList;
    }
  }
}
