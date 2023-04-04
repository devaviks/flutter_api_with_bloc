import 'package:flutter/material.dart';
import 'package:flutter_api_with_bloc/bloc/theme/themek_bloc.dart';
import 'package:flutter_api_with_bloc/themes/app_theme.dart';
import '../bloc/album/album_state.dart';
import '../bloc/album/albums_block.dart';
import 'package:flutter_api_with_bloc/bloc/album/albums_events.dart';
import 'package:flutter_api_with_bloc/model/album_model.dart';
import 'package:flutter_api_with_bloc/repositories/Albumsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AlbumClass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlbumClassState();
  }

}

class AlbumClassState extends State<AlbumClass>{
bool isdark=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAlbums();
  }

  loadAlbums() async
  {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
        actions: [
        Switch(
          value:  isdark,
          onChanged: (val) async {

            _setTheme(val);
            isdark=!isdark;
          },
        )
      ],),
      body: BlocBuilder<AlbumsBloc,AlbumsState>(builder: (BuildContext contex,AlbumsState state){

        if (state is AlbumListErrorstate) {
          final error = state.error;
          String message = '${error.message}\nTap to Retry.';
          return Text(
            message,

          );
        }
        if (state is AlbumLoadedState) {
          List<Albums> albums = state.albums;
          return _list(albums);
        }
        return Center(child: CircularProgressIndicator(),);



      }),
    );
  }
  Widget _list(List<Albums> albums) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (_, index) {
        Albums album = albums[index];
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            child: Text(
            album.title,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
              Divider(color: Theme.of(context).textTheme.bodyText1!.color,),
            ],
          ),
        );;
      },
    );

}
  _setTheme(bool darkTheme) async {
    AppTheme selectedTheme =
    darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    print(darkTheme);
    context.read<ThemekBloc>().add(ThemekEvent(appTheme: selectedTheme));
    //Preferences.saveTheme(selectedTheme);
  }

}

