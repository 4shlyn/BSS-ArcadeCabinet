// just to note: there's only a sqlite db for feed the flork as of rn but i engineered the code so that it's easy to scale

// remember to clean up data
// when selection ui is done then add in ldrbrd specificity
// optimization (refresh) DONE -- obviously clean up code

void showLeaderboard() {
  noFill();
  stroke(255);
  //rect(1, 1, 638, 478, 2);
  size(640, 480);
  pixeli = createFont("bonk.ttf", 60);
  textFont(pixeli);
  textAlign(CENTER);
  fill(0);
  rect(273, 0, 640, 450);
  fill(255);
  text("HIGH SCORES", 458, 80);
  textSize(16);
  int i = (15-abs(15-(frameCount/4)%30));
  text("Press   Z   to   exit", 458, 380+i);
  pixeli = createFont("bonk.ttf", 20);
  textFont(pixeli);
  pageLimit = 5;


  text("RANK", 350, 125);
  text("NAME", 450, 125);
  text("SCORE", 550, 125);


  if (refreshNeeded) {
    tableName = gary[selected][4];
    getVals(); // do NOT thread
  } else {
    printSavedLeaderboard();
  }
}
void addScore(String name, int score) {
  // get latest scoreId + 1 for new assignment
  db.query("SELECT scoreId FROM "+tableName+" ORDER BY scoreId desc");
  f = int(db.getString("scoreId")) + 1;

  //insertion
  db.query("INSERT INTO " + tableName + " VALUES("+f+",'"+name+"',"+score+")");
}

//
void refreshLeaderboard() {
  db.query("SELECT * FROM "+tableName+" ORDER BY score desc LIMIT "+pageLimit);
  j=0;
  while (db.next()) {
    //String cUsername = (db.getString("username"));
    //String cScore = (db.getString("score"));
    StringList womp = new StringList();

    womp.set(0, (db.getString("username")));
    womp.set(1, (db.getString("score")));
    currentL.add(j, womp);
    j++;
  }
  refreshNeeded = false;
}

void printSavedLeaderboard() {
  e = 20;
  for (int k = 0; k < 5; k++) {
    switch(k) {
    case 0:
      fill(255, 0, 0);
      text("1st", 350, 135+e);
      break;
    case 1:
      fill(0, 255, 0);
      text("2nd", 350, 135+e);
      break;
    case 2:
      fill(0, 0, 255);
      text("3rd", 350, 135+e);
      break;
    default: // 4th and after, stops at 5 for now
      fill(255);
      text(str(k+1)+"th", 350, 135+e);
      break;
    }
    text(currentL.get(k).get(0), 450, 135+e);
    text(currentL.get(k).get(1), 550, 135+e);
    e+=40;
  }

  textAlign(CENTER);
}

void getVals() {
  db = new SQLite(this, "leaderboards.db");
  if (db.connect()) {
    refreshNeeded = false;
    refreshLeaderboard();
    printSavedLeaderboard();
  }
}
