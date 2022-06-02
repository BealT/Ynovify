class Music {
  String title;
  String singer;
  String imagePath;
  String urlSong;

  Music (this.title, this.singer, this.imagePath, this.urlSong);
}

List<Music> musicList = [
  Music('Sing about me', 'lamaaaar', 'https://dice-media.imgix.net/attachments/2019-05-18/91b71cee-1ace-4182-944a-443e4a2959a1.jpg?rect=14%2C0%2C1472%2C1472', 'lib/musics/Sing About Me, Im Dying Of Thirst.mp3'),
  Music('Runaway', 'KAnye', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlRpRYX5I4gWUsNZcy3R0W-XkhOqjJZL-y8g&usqp=CAU', 'lib/musics/Runaway.mp3'),
  Music('3eme musique', 'artiste', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlRpRYX5I4gWUsNZcy3R0W-XkhOqjJZL-y8g&usqp=CAU', 'lib/musics/Runaway.mp3')
];