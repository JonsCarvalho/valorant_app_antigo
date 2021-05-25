import 'package:flutter/material.dart';
import 'package:valorantapp/shared/api.dart';
import 'package:valorantapp/shared/components/agent_card_widget.dart';
import 'package:valorantapp/shared/components/background_widget.dart';
import 'package:valorantapp/shared/models/agent_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Api api = Api();
  Loading stateLoading = Loading.IDLE;
  List<AgentModel> agentList;

  @override
  void initState() {
    getAgents();
    super.initState();
  }

  getAgents() async {
    stateLoading = Loading.LOADING;

    agentList = await api.getAgents();

    if (agentList != null) {
      stateLoading = Loading.SUCCESS;
    } else {
      stateLoading = Loading.FAIL;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          backgroundWidget(),
          Center(
            child: agentList == null
                ? CircularProgressIndicator()
                : GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: GridView.count(
                      crossAxisCount: 2,
                    ).gridDelegate,
                    itemCount: agentList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: AgentCardWidget(agent: agentList[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  appBar() {
    return AppBar(
      titleSpacing: 0,
      title: Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Valorant_logo.svg/1200px-Valorant_logo.svg.png',
        color: Color.fromRGBO(255, 82, 82, 1),
        width: 100,
      ),
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network('https://img.icons8.com/color/452/valorant.png'),
      ),
    );
  }
}

enum Loading { IDLE, LOADING, FAIL, SUCCESS }
