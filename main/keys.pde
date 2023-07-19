/*
KEY interactions are below, with notes

You only need to use one function: keysCheck()

keysCheck() takes in a string as input.
This input should be one of the letters "u", "d", "l", "r", "z" or "x"
These letters are for up, down, left, right and the z/x keys

keysCheck() returns a boolean (true or false) that
indicates if the input key is currently held down.

Use this function in conditional statements to
see if the user is pressing a given key, and what to
do in this event.
*/

// array to store what keys are currently pressed
int[] keysPressed = new int[10];
// the total number of keys currently held
int keyNum = 0;


// function to check if indicated key is currently held
boolean keysCheck(String keyToCheck) {
  int keysCheckCode = 0;
  // up down left right z x
  // 38 40 37 39 90 88
  // converting human readable string to keyCodes for checking
  if (keyToCheck == "u") {
    keysCheckCode = 38;
  } else if (keyToCheck == "d") {
    keysCheckCode = 40;
  } else if (keyToCheck == "l") {
    keysCheckCode = 37;
  } else if (keyToCheck == "r") {
    keysCheckCode = 39;
  } else if (keyToCheck == "z") {
    keysCheckCode = 90;
  } else if (keyToCheck == "x") {
    keysCheckCode = 88;
  }
  // looping through the keysPressed array and checking each element for the indicated keyCode.
  // if the value is found, change keyFound to true, otherwise will remain false
  boolean keyFound = false;
  for (int i = 0; i < keyNum; i++) {
    if (keysPressed[i] == keysCheckCode) {
      keyFound = true;
    }
  }
  return keyFound;
}

// built in function that triggers when a key is pressed down
// internal action to update keysPressed array
void keyPressed() {
  // Checking if the key being pressed is currently within the keysPressed array
  boolean keyFound = false;
  for (int i = 0; i < keyNum; i++) {
    if (keysPressed[i] == keyCode) {
      keyFound = true;
    }
  }
  // If the key is not found already in the keysPressed array,
  // add it to the array at index keyNum and increment keyNum
  if (!keyFound) {
    keysPressed[keyNum] = keyCode;
    keyNum++;
  }
}

// built in function that triggers when a key is released
// internal action to update keysPressed array
void keyReleased() {
  // Finding the position of the key that was released within the keysPressed array
  // and removing this value from the array and shifting the remaining elements to
  // an index one smaller
  boolean keyFound = false;
  for (int i = 0; i < keyNum; i++) {
    // check when we find the key in the keysPressed array
    if (keysPressed[i] == keyCode) {
      keyFound = true;
    }
    // if the key has been found copy the value from the next element to the current one (overwriting the values)
    if (keyFound) {
      keysPressed[i] = keysPressed[i+1];
    }
  }
  // decrement keyNum to reflect the new number of held keys
  keyNum = keyNum-1;
}
