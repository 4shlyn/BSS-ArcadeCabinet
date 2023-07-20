float angle;
int s, x, y, musicToggle;
void songplayer(int audioNum, int s, int x, int y) {
  // pushes matrix for rotation reset, translate canvas (0,0) point to middle of songplayer rectangle
  // then rotates angle degrees, and then resets back to normal position.
  pushMatrix();
  translate(x+85/200.0*s, y+30/200.0*s);
  rotate(radians(angle));
  translate(0-(x+85/200.0*s), 0-(y+30/200.0*s));

  strokeWeight(0);
  fill(246, 197, 238);
  rect(x+(100/300.0)*s, y+(25/300.0)*s, (50/300.0)*s, (50/300.0)*s, (7/300.0)*s);
  fill( (songs[audioNum].percent())*2, songs[audioNum].percent(), songs[audioNum].percent());
  rect(x+(100/300.0)*s, y+(75/300.0)*s, (50/300.0)*s, 0-((songs[audioNum].percent()/2.0)/300.0*s), (7/300.0)*s);

  // no overflow of queue calls
  fill(255);
  if (play) {
    rect(x+80/200.0*s, y+30/200.0*s, 3/200.0*s, 10/200.0*s);
    rect(x+85/200.0*s, y+30/200.0*s, 3/200.0*s, 10/200.0*s);
    if (!playing) {
      songs[audioNum].play();
      playing = true;
    }
  } else {
    triangle(x+80/200.0*s, y+28/200.0*s, x+80/200.0*s, y+40/200.0*s, x+90/200.0*s, y+34/200.0*s);
    if (playing) {
      songs[audioNum].pause();
      playing = false;
    }
  }

  // angle is degree of shakiness and frameCount affects frequency
  // popMatrix resets canvas orientation, not translation
  popMatrix();
  if (frameCount % 50 == 0 && play) {
    angle = 5;
  } else if (frameCount % 25 == 0 && play) {
    angle = -5;
  } else if (!play) {
    angle = 0;
  }

  // play/pause
  if (keysCheck("z") && frameCount >= musicToggle + 30) {
    play = !play;
    musicToggle = frameCount;
  }
  if (songs[audioNum].percent() >= 99.999) {
    songs[audioNum].stop();
    songs[audioNum].cue(0);
    songs[audioNum].play();
  }
}
