Boolean startBox = true; // true is on start, false is on startBox

// starting screen UI
void start_state() {
  font = createFont("pixeloid.ttf", 20);
  background(242, 254, 255);
  // grass and building
  noStroke();
  fill(103, 145, 98);
  rect(0, 450, 640, 30);
  
  // thx clara gm for triangle building:
  fill(200);
  triangle(458, 450, 418, 450, 438, 110);
  fill(0);
  ellipse(438, 188, 25, 25);
  
  
  // UI
  noFill();
  strokeWeight(2);
  rect(0, 0, 640, 480);
  fill(255);
  
  // all text on screen
  fill(0);
  textSize(15);
  text("start", 155, 230);
  text("kawinkiedink", 155, 250);
  textSize(8);
  text("(flork shop)", 155, 265);
  textSize(40);
  text("feed the fl rk", 135, 200);
  textSize(17);
  fill(198, 222, 253);
  rect(180, 325, 280, 60, 9);
  fill(255-abs(255-frameCount%510), 255-abs(255-frameCount-100%510), 255-abs(255-frameCount-200%510));
  text("Press X to confirm", 215, 363);


  //  choices are confirmed
  if (!startBox) { // shop hover
    textFont(font);
    if (((keysCheck("u") || keysCheck("d")) && frameCount >= toggle+20)) { 
      startBox = !startBox;
      toggle=frameCount;
    } else {
      fill(0);
      triangle(135, 240, 135, 248, 140, 244);
    }
  } else { // start hover
    font = createFont("pixeloid.ttf", 20);
    textFont(font);
    if ((keysCheck("u") || keysCheck("d")) && frameCount >= toggle+20) { 
      startBox = !startBox;
      toggle = frameCount;
    } else {
      fill(0);
      triangle(135, 220, 135, 228, 140, 224);
    }
  }

  if (keysCheck("x")) { // if x is clicked
    if (startBox) { 
      transition=true;
      tr_type="to_play";
    } else { 
      fill(230, 40, 40);
      textSize(17);
      text("Coming Soon!", 248, 411);
    }
  }

  songplayer(0, 200, 490, 10);
}
