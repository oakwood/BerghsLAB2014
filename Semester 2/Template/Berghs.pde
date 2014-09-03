float KEY_LEFT;
float KEY_RIGHT;
float KEY_UP;
float KEY_DOWN;
float KEY_A;
float KEY_S;
float KEY_D;
float KEY_F;
float KEY_G;
float KEY_SPACE;
float SONAR;
float SB_BUTTON;
float SB_BUTTON_2;
float SB_RANGE;
float SERVO;

int frame = 0;
void update() {
  if(frame == 0){
    // setup
  }
  frame++;
  
  //SONAR =
  
  
  //write servo
  
 // SERVO

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      KEY_LEFT = 1.0;
    }
    else if (keyCode == RIGHT) {
      KEY_RIGHT = 1.0;
    }
    else if (keyCode == UP) {
      KEY_UP = 1.0;
    }
    else if (keyCode == DOWN) {
      KEY_DOWN = 1.0;
    }
  }
  else if (key == 'a') {
    KEY_A = 1.0;
  }
   else if (key == 's') {
    KEY_S = 1.0;
  }
   else if (key == 'd') {
    KEY_D = 1.0;
  }
   else if (key == 'f') {
    KEY_F = 1.0;
  }
   else if (key == 'g') {
    KEY_G = 1.0;
  }
   else if (key == ' ') {
    KEY_SPACE = 1.0;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      KEY_LEFT = 0.0;
    }
    else if (keyCode == RIGHT) {
      KEY_RIGHT = 0.0;
    }
    else if (keyCode == UP) {
      KEY_UP = 0.0;
    }
    else if (keyCode == DOWN) {
      KEY_DOWN = 0.0;
    }
  }
  else if (key == 'a') {
    KEY_A = 0.0;
  }
   else if (key == 's') {
    KEY_S = 0.0;
  }
   else if (key == 'd') {
    KEY_D = 0.0;
  }
   else if (key == 'f') {
    KEY_F = 0.0;
  }
   else if (key == 'g') {
    KEY_G = 0.0;
  }
   else if (key == ' ') {
    KEY_SPACE = 0.0;
  }
}

