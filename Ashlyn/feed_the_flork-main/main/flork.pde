float vx, locx;
float locy = 300;
PImage flork_type;
int florkNum;
String florkDir = "right"; // just starting off with right facing flork

// flork movement and costume management
void florkUpdate() {

  if (!transition) {
    // if L is pressed, change flork to look left
    if (keysCheck("l")) {
      vx -= 0.3;
      florkDir = "left";

      // if R is pressed, change flork to look right
    } else if (keysCheck("r")) {
      vx += 0.3;
      florkDir = "right";
    }
  }

  // if on a sugar rush
  if (bonus == 1.2) {
    florkNum= 2; // blush flork
  } else {
    florkNum = 0; // basic flork
  }
  
  // if it's eating
  if (eating) {
    if (bonus==1.2) { // and on sugar rush
      florkNum = 3; // blush chomp
    } else {
      florkNum = 1; // normal chomp
    }
  } else if (tomatoEating) { // if eating tomato
    florkNum = 4; // sad flork
  }

  // updates flork type based on info above
  if (florkDir == "left") {
    flork_type = florksL[florkNum];
  } else {
    flork_type = florksR[florkNum];
  }

  // boundaries
  if (locx >= 640) {
    locx = locx-900;
  } else if (locx <= -270) {
    locx = 640;
  }
  // movement slows down over time, changes x location of flork
  vx *= 0.95;
  locx+=vx;
  // draw flork
  image(flork_type, locx+50, locy);
  
  // grass needs to be after flork
  noStroke();
  fill(103, 145, 98);
  rect(0, 470, 640, 10);
}
