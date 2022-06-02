import 'package:flutter/material.dart';
import 'models/music.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
        home: const YnofifySFW());
  }
}

class YnofifySFW extends StatefulWidget {
  const YnofifySFW({Key? key}) : super(key: key);

  @override
  State<YnofifySFW> createState() => _YnofifySFWState();
}

class _YnofifySFWState extends State<YnofifySFW> with TickerProviderStateMixin {
  Duration duration = new Duration(seconds: 0);
  int pos = 0;
  int totalSongs = musicList.length;
  bool isPlaying = false;
  final _player = AudioPlayer();

   @override
  void initState() {
    super.initState();
    initSong(musicList[0].urlSong);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(title: const Text('Yonvify'), centerTitle: true, backgroundColor: Colors.black, foregroundColor: Colors.white),
      body: Column(
        children: <Widget>[
          // ici mettre widgets
          SizedBox(height: 30,),
          Image.network(
              musicList[pos].imagePath,
              width: 320.0,
              height: 320.0,),
              
          SizedBox(height: 40,),
          Text(musicList[pos].title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40.0)),
          SizedBox(height: 20,),
          Text(musicList[pos].singer, style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20.0)),
          //Text(pos.toString(), style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 20.0)),
          SizedBox(height: 50,),
          //Text("chocolat", style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              returnIcon(Icons.skip_previous, ActionMusic.backward),
              SizedBox( width: 20,),
              returnIcon(isPlaying ? Icons.pause : Icons.play_arrow, ActionMusic.play),
              SizedBox( width: 20,),
              returnIcon(Icons.skip_next, ActionMusic.forward),
          ],),  
          SizedBox(height: 20),
          songDuration()
        ],
      ),
    );
  }

  Widget returnIcon(IconData myIcon, ActionMusic myAction) {
    return Material(
      color:Color.fromARGB(255, 0, 0, 0),
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 69, 118, 141),
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(myIcon),
            color: Colors.white,
            onPressed: () {
              if(myAction == ActionMusic.play){
                if(isPlaying == false) {
                  setState(() {
                    isPlaying = true;
                    initSong(musicList[pos].urlSong);
                    playMusic();
                  });
                } else if(isPlaying == true) {
                  setState(() {
                    isPlaying = false;
                    initSong(musicList[pos].urlSong);
                    pauseMusic();
                  });
                }
              } else if(myAction == ActionMusic.forward) {
                if((pos + 1) >= (totalSongs)) {
                setState(() {
                  pos = 0;
                });
                } else {
                  setState(() {
                    pos ++;                   
                  });
                }
                if(isPlaying == true) {
                  initSong(musicList[pos].urlSong);
                  playMusic();
                }
              } else if(myAction == ActionMusic.backward) {
                if((pos - 1) < 0 ) {
                setState(() {
                  pos = totalSongs - 1;
                });
                } else {
                  setState(() {
                  pos --;  
                  });
                }
                if(isPlaying == true) {
                  initSong(musicList[pos].urlSong);
                  playMusic();
                }
              }              
            },
          ),
        ),
      ),
    );
  }

  Future<void> initSong(String urlSong) async {
    await _player.setAudioSource(
        AudioSource.uri(Uri.parse(urlSong))).then((value) => {
      setState(() {
        duration = value!;
      })
    });
  }

  Future playMusic() async {
    _player.play();
  }

  Future pauseMusic() async {
    await _player.pause();
  }

   Widget songDuration() {
    
      return Center(
        child: Text(
          duration.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20.0)
            ),
      );
  }
}

enum ActionMusic { play, forward, backward }

//alexandrevallet69@gmail.com

