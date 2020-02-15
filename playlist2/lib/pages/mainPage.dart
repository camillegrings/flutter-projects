import 'package:flutter/material.dart';
import 'package:playlist2/components/genre.dart';
import 'package:playlist2/components/header.dart';
import 'package:playlist2/components/songs.dart';
import 'package:playlist2/model/song.dart';

import '../constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Song> listToShow = favSongs;
  List order = [favSongs, rockSongs, sertanejoSongs, popSongs, pagodeSongs];
  String genreSelected = 'Favoritos';

  updateSongsToShow(List<Song> newList, String genre) {
    setState(() {
      listToShow = newList;
      genreSelected = genre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Color.fromRGBO(255, 64, 96, 1),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.3),
        selectedItemColor: Colors.white,
        iconSize: 20,
        selectedLabelStyle: TextStyle(fontSize: 13),
        items: [
          BottomNavigationBarItem(
              title: Text("Browse"), icon: Icon(Icons.broken_image)),
          BottomNavigationBarItem(
              title: Text("All tracks"), icon: Icon(Icons.library_music)),
          BottomNavigationBarItem(
              title: Text("Playlists"), icon: Icon(Icons.library_books)),
          BottomNavigationBarItem(
              title: Text("Search"), icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Header(),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (BuildContext context, int index) {
                    String name = genres[index];
                    bool isSelected = genreSelected == name;
                    List<Song> songs = order[index];
                    return Genre(
                      name: name,
                      isSelected: isSelected,
                      onTap: () {updateSongsToShow(songs, name);},
                    );
                  }),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listToShow.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isPlaying = index == 0;
                  return Songs(
                    title: listToShow[index].title,
                    singer: listToShow[index].singer,
                    isPlaying: isPlaying,
                  );
                }),
          )
        ],
      )),
    );
  }
}
