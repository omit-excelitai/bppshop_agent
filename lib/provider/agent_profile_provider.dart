import 'package:bppshop/http_data/agent_profile_http.dart';
import 'package:bppshop/model/agent_profile_model.dart';
import 'package:flutter/material.dart';

class AgentProfileProvider with ChangeNotifier{
  List<AgentProfileModel> agentProfileData = [];

  getAgentProfileData() async {
    agentProfileData = await AgentProfileHttpRequest.fetchAgentProfileData();
    notifyListeners();
  }
}