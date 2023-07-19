PVector sugar_loc = new PVector(400, 0);
boolean last_act = false;
boolean sugar_fall = false;
boolean eating = false;
boolean tomatoEating = false;
float bonus = 1;
int rush_start, eatToggle;
float fall_speed;


void el(int j) {
  int f = int(random(0, 1000));
  float en_check = random(0, 10);
  
  if (fallers[j]) { // if it's already falling, continue
    release(j);
    
  } else if (f<2) { // if x is less than 2, start falling and assign object type
    fall_locs[j].x=random(20, 620);
    fallers[j] = true;
    // defaults to pineapple
    is_an_enemy[j] = false;
    
    // if en_check is less than 7 and there's no boost, make it a tomato
    if (en_check >= 7 && bonus != 1.2) {
      is_an_enemy[j] = true;
    }
  }
  
   // flork deco
  if (frameCount >= eatToggle+16) {
    eating=false;
    tomatoEating = false;
  }
}

void release(int j) {
  noStroke();
  // drawing up to limit number of pineapples/tomatoes
  if (is_an_enemy[j]) {
    fall_locs[j].y +=fall_speed + 0.3; // move down for next instance
    fill(255, 0, 0);
    ellipse(fall_locs[j].x, fall_locs[j].y, 10, 10); // tomato
    fill(30, 200, 30);
    ellipse(fall_locs[j].x, fall_locs[j].y-5, 3, 3); // stem
  } else {
    fall_locs[j].y +=fall_speed; // move down for next instance
    fill(242, 242, 126);
    ellipse(fall_locs[j].x, fall_locs[j].y, 9, 12); // pineapple
    fill(30, 200, 30);
    ellipse(fall_locs[j].x, fall_locs[j].y-8, 3, 4); // stem
  }


  // object boundaries
  if (fall_locs[j].y>640) {
    fall_locs[j].y=0;
    fallers[j] = false;

    // if object touching flork
  } else if (fall_locs[j].y < locy+75 && fall_locs[j].y > locy+27 && fall_locs[j].x > locx+148 && fall_locs[j].x < locx+270 && !transition) {
    if (is_an_enemy[j]) {
      tomatoes++;
      ough.cue(0.34);
      ough.play();
      tomatoEating = true;
    } else {
      score += 1*bonus;
      chomp.cue(0.2);
      chomp.play();
      eating = true;
    }
    // used for costume change in flork
    eatToggle = frameCount;
    
    // reset location to 0, and it is no longer falling
    fall_locs[j].y=0;
    fallers[j] = false;
  }
  // if 5 seconds have passed, reset bonus
  if (frameCount >= rush_start + 300) {
    bonus = 1;
  }
}

// when sugar spawn is less than 5 or score is 25, candy is dropped
// if flork catches, score is boosted by 1.2x for 5 seconds
void sugar() {
  // random pink pineapple drop
  float sugar_spawn = random(0, 10000);
  // will drop at 25kg, and then random from then on
  if ((score==25|| sugar_fall||sugar_spawn < 5) && !transition) {
    sugar_fall = true;
    noStroke();
    fill(246, 197, 238);
    ellipse(sugar_loc.x, sugar_loc.y, 20, 20); // pink pineapple
    fill(242, 242, 126);
    rect(sugar_loc.x-10, sugar_loc.y-1, 20, 2); // square thing

    // boundary management
    if (last_act) {
      sugar_loc.x += 1;
    } else {
      sugar_loc.x -=1;
    }
    if (sugar_loc.x == 550 || sugar_loc.x == 100) {
      last_act = !last_act;
    }
    // updates y value to "fall down"
    sugar_loc.y += fall_speed-0.3;

    if (sugar_loc.y >= 480) {
      sugar_fall = false;
      sugar_loc.y = 0;
    }

    // if flork touches pink pineapple
    if (sugar_loc.y < locy+75 && sugar_loc.y > locy+27 && sugar_loc.x > locx+148 && sugar_loc.x < locx+270 && !transition) {
      // pineapples count for 1.2 times points for 5 seconds
      // plays candy crush's tasty and gets pink pineapple off screen
      bonus = 1.2;
      rush_start = frameCount;
      sugar_fall = false;
      sugar_loc.y = 0;
      tasty.cue(0.4);
      tasty.play();
    }
  }
}
