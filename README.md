# BSS-ArcadeCabinet 1.0!
UI and sqlite management for the cabinet, with my game for a sample
Displays history of ICS3U games, from 2022 onwards - see the DT Lab for the cabinet!

Cabinet Code last updated June, 2023
To test it out, you'll need:
  - Processing 4
  - A JRE or JDK version 17 or older
  - If you're NOT using Mac, download SQLITE (can be done through cmd line)
  - If you're NOT using Windows, you'll have to re-do pathways if you want to access the game through the main UI.
      > Note: You can still access the game as you would normally; the processing-java lang would just otherwise handle it for you from the main script.

  - The most recent sound library in Processing - Tools - Libraries
  - SqliteDebier (i think) library in ^

Note that the following keys will correspond to these actual keys:
  Up, Left, Down, Right, Z, X
  W A S D F G 


Variables that need changing are in **main/main.pde** and **Ashlyn/goBack.pde** (you'll have to move the file into the folder) based off of clone location and your os. 
Remember to change:
  String cmd
  String basic
  String sketchpath
