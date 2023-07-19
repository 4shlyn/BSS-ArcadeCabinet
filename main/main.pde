PFont font0, font, lemonMilk, aaa, beacht;
boolean refreshNeeded;
boolean showLdr;
String basic = "C:\\Users\\USERNAME-HERE\\OneDrive\\Desktop\\BSSArcade-main\\";

String[][] gary = {
  {"Ashlyn L", "Feed the Flork", basic+"Ashlyn\\feed_the_flork-main\\main", "000", "ashlynL"},
  {"Clara MS", "Space Race", basic+"Clara\\finalGame", "001"},
  {"Cat B", "Laser Dodge", basic+"CAt\\Cat_Game_Final", "002"},
  {"Chloe M", "Climate Game", basic+"Chloe\\ICS3U_Climate_video_game", "003"},
  {"Fatima A", "Pop Game", basic+"Fatima\\ICS3U_2223_gamePop", "004"},
  {"Halle J", "Kirmit's Space Adv", basic+"Halle\\ICS3U_2223_Kirmits_Space_Adventure", "005"},
  {"Hannah R", "Cow Game", basic+"Hannah\\versionOfCowGameJustSize", "006"},
  {"Kaelyn M", "It's Raining Cats", basic+"Kaelyn\\It_s_Raining_Cats", "007"},
  {"Njala B", "Gravity Ball", basic+"Njala\\Summative_Game", "008"},
  {"Olivia M", "Mini Game", basic+"Olivia\\miniGame", "009"},
  {"Rachel L", "Shooting Stars", basic+"Rachel\\rachelLeung_shootingStars_ICS3Ugame", "010"},
  {"Clara GM", "Star Shower", basic+"ClaraG\\ICS3U_2223_gameTemplate_Clara_Garcia_Moreno", "011"},
  {"Anise B", "Asteroids", basic+"Anise\\main", "012"},
  {"Charlotte J", "Cool Shapes", basic+"Charlotte\\Final_Project_CharlotteJin", "013"},
  {"Philly Cheese Steak (CS)", "Send Help", basic+"Phyllis\\IC3SU_2223_game_PHYLLIS", "014"}
};
ArrayList<StringList> currentL;
import de.bezier.data.sql.*;
SQLite db; // (primary key made to userId)
PFont pixeli, bob, schmob;
int e, j, f, i, pageLimit, selected, grape, lastFrame;
String tableName, cUsername, cScore;
PImage img, beach, jungle;
void setup() {
  showLdr = false;
  refreshNeeded = true;
  selected = 0; // start w gameId 0 (me) shown
  font0 = createFont("bob.ttf", 20);
  font = createFont("schmob.ttf", 20);
  lemonMilk = createFont("LEMONMILK-Bold.otf", 20);
  aaa = createFont("THEBOLDFONT.ttf", 20);
  beacht = createFont("Aesthetic-Regular.otf", 50);

  img = loadImage("logo.png");
  beach = loadImage("beach.jpeg");
  jungle = loadImage("jungle.JPEG");


  noStroke();
  size(640, 480);
  currentL = new ArrayList<StringList>();
}

void draw() {
  ashlyn();
  drawList();
  //println(mouseX,mouseY);
  if (keysCheck("z") && frameCount > lastFrame + 10 && gary[selected].length==5) {
    showLdr = !showLdr;
    lastFrame = frameCount;
  } else if (keysCheck("d") && frameCount > lastFrame + 10) {
    showLdr = false;
    selected = (selected + 1) % 15;
    lastFrame = frameCount;
  } else if (keysCheck("u") && frameCount > lastFrame + 10) {
    showLdr = false;
    selected+=14;
    selected %= 15;
    lastFrame = frameCount;
  }
  if (showLdr) {
    showLeaderboard();
  }
  String sketchpath = gary[selected][2];
  String cmd = "C:\\Users\\USERNAME-HERE\\Downloads\\processing-4.1.2-windows-x64\\processing-4.1.2\\processing-java --sketch=" + sketchpath + " --present";  if (keysCheck("x")) {
    //println(cmd);
    try {
      Runtime.getRuntime().exec(cmd);
      exit();
    }
    catch(Exception e) {
      println(e);
    }
  }

  textSize(13);
  textAlign(LEFT);
  text("("+str(selected+1)+"/15)", 8, 18);
}


void refresh() {
  background(242, 254, 255);
  textAlign(CENTER);
  font = createFont("schmob.ttf", 20);

  textFont(font);
  fill(103, 145, 98);
  rect(230, 450, 640, 30);
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Developer: Ashlyn Lee, ICS3U-22/23", 285, 470);
  fill(208, 220, 221);
  quad(230, 450, 460, 450, 570, 0, 230, 0);
  fill(194, 122, 96);
  textSize(30);
}

void drawList() {
  font = createFont("schmob.ttf", 10);
  textFont(font);
  fill(118, 139, 145);
  rect(0, 0, 270, 480);

  // list: Game name, Dev Name, pathto (for linux, mac for testing),gameId for leaderboard access (null if points not accounted for)
  fill(131, 163, 139);
  strokeWeight(4);
  // gradient
  color c1 = color(151, 189, 157);
  color c2 = color(153, 186, 196);
  for (int i = 0; i <268; i++) {
    float inter = map(i, 50, 300, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(i, 0, i, 70 + 25 - (i/20));
  }
  textFont(lemonMilk);

  fill(255);
  textSize(22);
  textAlign(CENTER);
  text(gary[selected][1], 130, 50);
  textSize(12);
  text(gary[selected][0], 130, 65);
  grape=1;
  for (int i = selected+1; i< gary.length; i++) {
    textSize(16);
    textAlign(LEFT);
    text(gary[i][1], 40, 70 + (grape*62));
    textSize(9);
    text(gary[i][0], 55, 85 + (grape*62));
    grape++;
  }

  /*
   determine names:
   Untitled - Alexis W
   Untitled - Brooke D
   Untitled - Crystal G
   Untitled - Katja W
   Untitled - Michelle W
   Untitled - Soleila C
   Untitled - Taylor M
   */
}
