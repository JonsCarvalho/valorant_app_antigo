import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorantapp/shared/components/background_widget.dart';
import 'package:valorantapp/shared/models/agent_model.dart';

class AgentPage extends StatelessWidget {
  final AgentModel agent;

  const AgentPage({@required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Stack(
        children: [
          backgroundWidget(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageFullPortraitWidget(),
                  roleWidget(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: descriptionWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    agent.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 30,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  descriptionWidget() {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
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
        ),
        Container(
          width: 250,
          child: Text(
            agent.role.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 30,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  imageFullPortraitWidget() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 250,
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
    );
  }

  roleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          agent.role.displayName,
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 50,
              child: CachedNetworkImage(
                imageUrl: agent.role.displayIcon,
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
        ),
      ],
    );
  }

  appBar(context) {
    return AppBar(
      title: Text(
        agent.displayName,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: Colors.black,
    );
  }
}
