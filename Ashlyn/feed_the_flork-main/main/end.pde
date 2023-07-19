boolean end_box = false;
void end_state() {
  songplayer(2, 200, 490, 10);
  
  // UI
  noFill();
  strokeWeight(2.5);
  fill(255);
  stroke(0);
  textFont(font);

  // UI for choice on exit and replay
  if (end_box) { // on exit
    fill(200);
    rect(200, 260, 80, 20, 8);
    fill(255);
    rect(320, 260, 80, 20, 8);
  } else { // on replay
    fill(255);
    rect(200, 260, 80, 20, 8);
    fill(200);
    rect(320, 260, 80, 20, 8);
  }


  // more UI
  fill(0);
  textSize(20);
  text("game over", 245, 200);
  String social_score = "+ " + nf(score, 0, 1) + " social credit";
  textSize(10);
  text(social_score, 250, 220);
  fill(0);
  text("play again", 208, 273);
  text("exit", 346, 273);
  ellipse(300, 270, 13, 13);
  fill(255-abs(255-frameCount%510), 255-abs(255-frameCount-100%510), 255-abs(255-frameCount-200%510));
  text("press x to confirm", 480, 460);

  // checks for right/left arrow input every 20 frames
  if ((keysCheck("l") || keysCheck("r")) && frameCount >= toggle+20) {
    end_box = !end_box;
    toggle = frameCount;
  }


  if (keysCheck("x")) {
    if (end_box) {
      tr_type = "to_play";
    } else {
      tr_type = "to_start";
    }
    transition = true;
  }
}
