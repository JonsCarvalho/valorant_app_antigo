import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorantapp/pages/agent_page.dart';
import 'package:valorantapp/shared/models/agent_model.dart';

class AgentCardWidget extends StatelessWidget {
  final AgentModel agent;

  const AgentCardWidget({Key key, @required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  child: CachedNetworkImage(
                    imageUrl: agent.displayIcon,
                    filterQuality: FilterQuality.low,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  agent.displayName,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100,
            child: CachedNetworkImage(
              imageUrl: agent.fullPortrait,
              filterQuality: FilterQuality.low,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            print(agent.displayName);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => AgentPage(agent: agent),
              ),
            );
          },
          child: Container(),
        ),
      ],
    );
  }
}
