void mouseClicked() {
  println("bye!");
  String sketchpath = "C:\\Users\\USERNAME-HERE\\OneDrive\\Desktop\\testering";
  String cmd = "C:\\Users\\USERNAME-HERE\\Downloads\\processing-4.1.2-windows-x64\\processing-4.1.2\\processing-java --sketch=" + sketchpath + " --present";
  println(cmd);
  try {
    Runtime.getRuntime().exec(cmd);
    exit();
  }
  catch(Exception e) {
    println(e);
  }
}
