import 'package:bloc_demo/Bloc/catogery_bloc.dart';
import 'package:bloc_demo/Model/CatogeryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerDetails extends StatefulWidget {
  const PlayerDetails({Key? key,required this.index}) : super(key: key);
 final int index;
  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
  @override
  late CatogeryModel catogeryModel;
  void initState() {
    BlocProvider.of<CatogeryBloc>(context).add(getPlayers());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CatogeryBloc, CatogeryState>(
  builder: (context, state) {
    if (state is CatogeryLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }if (state is CatogeryError){
      return Center(
        child: Text("Something Went Wrong"),
      );
    }if(state is CatogeryLoaded){
      catogeryModel=BlocProvider.of<CatogeryBloc>(context).catogeryModel;
      return     Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 50,
              backgroundImage:NetworkImage(catogeryModel.response![widget.index].player!.photo.toString()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            width: 100,
            child: Column(
              children: [
                Text(catogeryModel.response![widget.index].player!.name.toString()),
                Text(catogeryModel.response![widget.index].player!.age.toString()),
                Text(catogeryModel.response![widget.index].player!.nationality.toString()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Goals",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Total="+catogeryModel.response![widget.index].statistics![0].goals!.total.toString()),
                      Text("Concided="+catogeryModel.response![widget.index].statistics![0].goals!.conceded.toString()),
                      Text("Assists="+catogeryModel.response![widget.index].statistics![0].goals!.assists.toString()),
                      Text("Saves="+catogeryModel.response![widget.index].statistics![0].goals!.saves.toString()),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Passes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Total="+catogeryModel.response![widget.index].statistics![0].passes!.total.toString()),
                      Text("Key="+catogeryModel.response![widget.index].statistics![0].passes!.key.toString()),
                      Text("Accuracy="+catogeryModel.response![widget.index].statistics![0].passes!.accuracy.toString()),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shot",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Total="+catogeryModel.response![widget.index].statistics![0].shots!.total.toString()),
                      Text("On="+catogeryModel.response![widget.index].statistics![0].shots!.on.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }return Container();
  },
),
    ));
  }
}
