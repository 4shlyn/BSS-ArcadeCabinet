// manages background and pause checks
String score_full, tomatoes_full;

// this resets all necessary variables for game reset
void gameStart() {
  tomatoes = 0;
  score = 1;
  fall_speed = 2;
  for (int i=0; i<600; i++) {
    fallers[i] = false;
    fall_locs[i] = new PVector(0, 0);
    is_an_enemy[i] = false;
  }
  limit = 40;
}


// CREDIT TO: CHARLOTTE for PAUSE CODE :) with some alterations
// displays playing background + checks for x to pause
void gamePlay() {
  songplayer(1, 200, 490, 10);
  fall_speed = 2 + score/30;

  // UI
  textSize(10);
  fill(255-abs(255-frameCount%510), 255-abs(255-frameCount-100%510), 255-abs(255-frameCount-200%510));
  text("press x to pause/exit", 480, 460);
  fill(0);
  score_full = "weight: "+nf(score, 0, 1)+" kg";
  tomatoes_full = "tomatoes: "+str(tomatoes);
  text(score_full, 20, 20);
  text(tomatoes_full, 20, 40);

  // if x is pressed and it wasn't pressed within the last second
  if (keysCheck("x") && frameCount >= toggle + 60) {
    state = "pause";
    toggle = frameCount;
  }
  
  // if tomatoes reaches 3 (or somehow goes over), game over
  if (tomatoes >=3) {
    tr_type="to_end";
    transition=true;
  }

  // the limit of objects on screen will increase until a max of 400
  if (score%20 <=1 && score < 401) {
    limit = 30 + int(score*1.5);
  }
  
  // if on a sugar rush (bonus is 1.2 on a sugar rush)
  if (bonus == 1.2) {
    fill(246, 197, 238);
    textSize(10);
    text("sugar rush! (1.2x bonus)", 455, 445);
  }
}

// pause UI and input check
void pause() {
  
  // UI
  textFont(font);
  fill(0, 0, 0, 128);
  rect(0, 0, 640, 480);
  strokeWeight(1);
  stroke(255);
  
  // UI for choice on exit and resume
  if (end_box) {
    fill(255);
    rect(322, 172, 60, 20, 8);
    fill(150);
    rect(237, 172, 60, 20, 8);
  } else {
    fill(255);
    rect(237, 172, 60, 20, 8);
    fill(150);
    rect(322, 172, 60, 20, 8);
  }
  // more UI
  fill(0);
  textSize(10);
  text("resume", 246, 185);
  text("exit", 338, 185);
  ellipse(310, 182, 13, 13);
  fill(255);
  textSize(25);
  stroke(255);
  text("Game Paused", 225, 150);
  strokeWeight(1.2);
  line(210, 160, 423, 160);
  textSize(10);
  fill(255-abs(255-frameCount%510), 255-abs(255-frameCount-100%510), 255-abs(255-frameCount-200%510));
  text("press x to confirm", 480, 460);

  // checks for right/left arrow input every 20 frames
  if ((keysCheck("l") || keysCheck("r")) && frameCount >= toggle+20) {
    end_box = !end_box;
    toggle = frameCount;
  }
   
  // if x is clicked (choice confirmed)
  if (keysCheck("x") && frameCount >= toggle+10) {
    if (end_box) {
      transition = true;
      tr_type = "to_end";
      songs[1].stop();
    } else {
      state="play";
      toggle = frameCount;
    }
  }
}
