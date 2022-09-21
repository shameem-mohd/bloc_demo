import 'package:bloc_demo/Bloc/catogery_bloc.dart';
import 'package:bloc_demo/Model/CatogeryModel.dart';
import 'package:bloc_demo/PlayerDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      appBar: AppBar(
        title: Text("Players"),
      ),
      body:BlocBuilder<CatogeryBloc,CatogeryState>(
        builder: (context,state){
          if(state is CatogeryLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }if (state is CatogeryError){
            return Center(
              child: Text("Somethimg Went Wrong"),
            );
          }if (state is CatogeryLoaded){
            catogeryModel = BlocProvider.of<CatogeryBloc>(context).catogeryModel;
            return       ListView.builder(
              itemCount: catogeryModel.response!.length,
              itemBuilder: (BuildContext context,int index){
                return       Column(
                  children: [
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerDetails(index: index)));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 35,

                            backgroundImage: NetworkImage(catogeryModel.response![index].player!.photo.toString()),
                          ),
                          SizedBox(width: 30,),
                          Text(catogeryModel.response![index].player!.name.toString()),
                        ],
                      ),
                    ),
                  ],
                );
              },

            );
          }return Container();
        }
      )

    ));
  }
}
