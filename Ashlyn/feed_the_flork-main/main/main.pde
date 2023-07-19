// ics3u summative -> feed the flork!
// last updated jan 2023
PFont font;
Boolean[] fallers, is_an_enemy;
int level, tomatoes, toggle;
import processing.sound.*;
Boolean play, playing, ts, enemy;
SoundFile[] songs;
SoundFile[] game_songs;
SoundFile audio1, game_audio1, end_audio1, ough, chomp, tasty;
String state;
float e, score;
PVector[] fall_locs;
PImage basic_flork_R, basic_flork_L, eating_flork_R, eating_flork_L, sad_flork_R, sad_flork_L, blush_flork_R, blush_flork_L, blush_chomp_flork_R, blush_chomp_flork_L;
PImage[] florksL, florksR;

int numOfFlorks = 10;

// limit of objects on screen at once
int limit = 40;

// setting up the screen, must keep at 640x480 to match the intended display
void setup() {
  background(255);
  size(640, 480);
  font = createFont("pixeloid.ttf", 20);

  // thx to phyllis and anise for pngs below!
  state = "start";
  basic_flork_R = loadImage("longflorkr.png");
  basic_flork_L =loadImage("longflorkl.png");
  eating_flork_R = loadImage("mustardflorkr.png");
  eating_flork_L = loadImage("mustardflorkl.png");
  blush_flork_R = loadImage("blushflorkr.png");
  blush_flork_L = loadImage("blushflorkl.png");
  blush_chomp_flork_L = loadImage("blushchompflorkl.png");
  blush_chomp_flork_R = loadImage("blushchompflorkr.png");
  sad_flork_L = loadImage("sadflorkl.png");
  sad_flork_R = loadImage("sadflorkr.png");

  // adding flork to respective lists
  florksL = new PImage[numOfFlorks/2];
  florksR = new PImage[numOfFlorks/2];
  florksR[0] = basic_flork_R;
  florksL[0] = basic_flork_L;
  florksR[1] = eating_flork_R;
  florksL[1] = eating_flork_L;
  florksR[2] = blush_flork_R;
  florksL[2] = blush_flork_L;
  florksR[3] = blush_chomp_flork_R;
  florksL[3] = blush_chomp_flork_L;
  florksR[4] = sad_flork_R;
  florksL[4] = sad_flork_L;

  for (int i=0; i<numOfFlorks/2; i++) {
    florksL[i].resize(300, 220);
    florksR[i].resize(300, 220);
  }

  // starts with radio on
  play = true; // if i want to be playing something
  playing = false; // if i am playing something

  // music
  audio1 = new SoundFile(this, "wax.wav");
  game_audio1 = new SoundFile(this, "overflowin.wav");
  end_audio1 = new SoundFile(this, "bpatrol.wav");

  // sound effects
  ough = new SoundFile(this, "ough.wav");
  chomp = new SoundFile(this, "chomp.wav");
  tasty = new SoundFile(this, "tasty.wav");

  // amazing tracklist
  songs = new SoundFile[3];
  songs[0] = audio1;
  songs[1] = game_audio1;
  songs[2] = end_audio1;

  ts = true;
  e = 480;
  fallers = new Boolean[600];
  is_an_enemy = new Boolean[600];
  fall_locs = new PVector[600];
}
void draw() {
  background(255);
  
  // state management
  if (state=="start") {
    start_state();

  } else if (state == "play") {
    background(242, 254, 255);
    sugar();
    for (int j=0; j<limit; j++) { // goes through each falling object
      el(j);
    }
    gamePlay();
    florkUpdate();
  } else if (state == "pause") {
    pause();
  } else if (state == "end") {
    end_state();
  }
  if (transition) {
    slide(tr_type);
  }
}
