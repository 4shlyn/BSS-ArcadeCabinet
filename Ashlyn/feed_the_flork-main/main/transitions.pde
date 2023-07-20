boolean transition;
String tr_type;
void slide(String destination) {

  // slides square to cover screen
  if (ts) {
    play = false;
    noStroke();
    fill(0);
    rect(0, 0-e, 640, 490);
    e *= 0.93;
    if (e < 0.0001 && ts) {
      e = 480;
      ts = !ts;
    }
  }

  if (!ts) {
    if (destination == "to_play") {
      gameStart();
      state = "play";
    } else if (destination == "to_end") {
      state="end";
    } else if (destination == "to_start") {
      state="start";
    }
    fill(0);
    rect(0, 480-e, 640, 490);
    e *= 0.93;
    if (e<1) {
      e = 480;
      ts = true;
      play = true;
      playing=false;
      if (state=="start") {
        songs[0].cue(0);
        songplayer(0, 200, 490, 10);
      } else if (state=="play") {
        songs[1].cue(0);
        songplayer(1, 200, 490, 10);
      } else if (state=="end") {
        songs[2].cue(0);
        songplayer(2, 200, 490, 10);
      }

      transition = false;
    }
  }
}
