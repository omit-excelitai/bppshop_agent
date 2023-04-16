
import 'package:bppshop_agent/data/model/response_model/agent_dashboard_response_model.dart';
import 'package:flutter/material.dart';

class AgentDashboardProvider with ChangeNotifier{
  List<AgentDashboardModel> agentDashboardData = [];

  getAgentDashboardData() async {
    agentDashboardData = await AgentDashboardHttpRequest.fetchAgentDashboardData();
    notifyListeners();
  }
}