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
  
  if (fallers[j]) release(j);
  else if (f<2) {
    fall_locs[j].x=random(20, 620);
    fallers[j] = true;
    is_an_enemy[j] = false;
    if (en_check >= 7 && bonus != 1.2) is_an_enemy[j] = true;
  }
  
  if (frameCount >= eatToggle+16) {
    eating=false;
    tomatoEating = false;
  }
}
//object management
void release(int j) {
  noStroke();
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


  // object boundaries & collision
  if (fall_locs[j].y>640) {
    fall_locs[j].y=0;
    fallers[j] = false;
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

// boost 1
void sugar() {
  float sugar_spawn = random(0, 10000);
  // will drop at 25kg, and then random from then on
  if ((score==25|| sugar_fall||sugar_spawn < 5) && !transition) {
    sugar_fall = true;
    noStroke();
    fill(246, 197, 238);
    ellipse(sugar_loc.x, sugar_loc.y, 20, 20); // pink pineapple
    fill(242, 242, 126);
    rect(sugar_loc.x-10, sugar_loc.y-1, 20, 2); // square thing
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

    if (sugar_loc.y < locy+75 && sugar_loc.y > locy+27 && sugar_loc.x > locx+148 && sugar_loc.x < locx+270 && !transition) {
      bonus = 1.2;
      rush_start = frameCount;
      sugar_fall = false;
      sugar_loc.y = 0;
      tasty.cue(0.4);
      tasty.play();
    }
  }
}
