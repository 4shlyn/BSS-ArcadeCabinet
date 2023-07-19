void ashlyn() { 
  textFont(font0);
  textAlign(CENTER);
  textSize(30);

  switch(selected) {
  case 0: // ashlyn
    background(242, 254, 255);
    fill(0);
    text("FEED", 460, 100);
    text("FLORK!", 460, 150);
    textSize(10);
    text("THE", 460, 115);
    break;
  case 1: // clara ms
    background(0);
    image(img, 280, 70, 500*0.7, 250*0.7);
    fill(225, 232, 123);
    break;

  case 2: // cat b
    background(45, 7, 71);
    fill(220, 60, 20);
    text("LASER DODGE", 460, 140);
    // 273 to 640
    fill(36, 19, 4 );
    noStroke();
    rect(366, 280, 180, 200);
    triangle(366, 282, 547, 282, 456, 197);
    fill(255);
    stroke(153, 186, 196);
    break;

  case 3: // chloe
    image(beach, 272, 0);
    fill(95, 96, 133);
    textFont(beacht);
    text("Climate\nGame", 460, 140);
    fill(255);
    break;


  case 4: // fatima
    image(jungle, 272, 0);
    fill(17, 43, 12);
    text("POP\nGAME", 460, 100);
    fill(194, 224, 188);
    break;

  default:
    background(156, 148, 104);
    textSize(15);
    text(gary[selected][1], 460, 100);
    fill(80);
    break;
  }
  textFont(font0);



  int i = (15-abs(15-(frameCount/4)%30));
  textSize(20);
  text("Press Start (X)", 460, 300+i);
  textSize(10);
  if (gary[selected].length == 5) {
    text("View Leaderboard (Z)", 460, 330+i);
  } else {
    text("Scores not applicable", 460, 330+i);
  }

  // stuff
  fill(103, 145, 98);
  rect(230, 450, 640, 30);
  fill(0);
  textSize(15);



  // USER SPECIFIC GRASS COLOUR (?), NAME
  textFont(font);
  textSize(15);
  textAlign(LEFT);
  text("Developer: "+gary[selected][0]+", ICS3U-22/23", 285, 470);
}
