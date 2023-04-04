import 'package:flutter/material.dart';
import 'package:flutter_api_with_bloc/bloc/theme/themek_bloc.dart';
import 'bloc/album/albums_block.dart';
import 'package:flutter_api_with_bloc/repositories/Albumsrepository.dart';
import 'package:flutter_api_with_bloc/screens/albams.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      BlockExample()

      
    );
}

class BlockExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BlockExampleState();
  }

}

class BlockExampleState extends State<BlockExample>{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ThemekBloc(),
      child: BlocBuilder<ThemekBloc,ThemekState>(
        builder: (BuildContext context,ThemekState themestate){
          print("Called 2334");
          return   MaterialApp(
            theme: themestate.themeData,
            home: BlocProvider(create: (context)=>AlbumsBloc(albumsrepository: Albumsrepository()),
                child:AlbumClass()),

          );
        },
      ),);
  }

}


