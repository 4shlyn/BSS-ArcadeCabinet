float vx, locx;
float locy = 300;
PImage flork_type;
int florkNum;
String florkDir = "right";
// flork movement and costume management
void florkUpdate() {
  
  if (!transition) {
    if (keysCheck("l")) {
      vx -= 0.3;
      florkDir = "left";
    } else if (keysCheck("r")) {
      vx += 0.3;
      florkDir = "right";
    }
  }
  if (bonus == 1.2) florkNum= 2;
  else florkNum = 0;
  
  if (eating) {
    if (bonus==1.2) florkNum = 3;
    else florkNum = 1;
  } 
  else if (tomatoEating) florkNum = 4;
  if (florkDir == "left") {
    flork_type = florksL[florkNum];
  } else {
    flork_type = florksR[florkNum];
  }

  if (locx >= 640) locx -= 900;
  else if (locx <= -270) locx = 640;

  vx *= 0.95;
  locx+=vx;
  image(flork_type, locx+50, locy);

  noStroke();
  fill(103, 145, 98);
  rect(0, 470, 640, 10);
}
