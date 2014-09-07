int input = 0;
boolean inputChanged = false;

void setup() {
  size(500,500);
}

void draw() {
  // Always call the update in the beggining of your
  // draw(), it otherwise your Arduino and Spacebrew
  // won't work.
  update();
  
  background(0);  
 
  // Draw the sonar data
  fill(255);
  text("SONAR", 10,20);
  fill(255, 0, 0);
  rect(0,30, SONAR * width, 20);
 
  // Draw the keys that are being pressed in red
  // KEY_LEFT ----------------------
  if(KEY_LEFT == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_LEFT", 10, 80);
  
  // KEY_RIGHT ----------------------
  if(KEY_RIGHT == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_RIGHT", 10, 100);
  
  // KEY_UP ----------------------
  if(KEY_UP == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_UP", 10, 120);
  
  // KEY_DOWN ----------------------
  if(KEY_DOWN == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_DOWN", 10, 140);
  
  // KEY_SPACE ----------------------
  if(KEY_SPACE == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_SPACE", 10, 160);
  
  // KEY_A ----------------------
  if(KEY_A == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_A", 10, 180);
  
  // KEY_S ----------------------
  if(KEY_S == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_S", 10, 200);
  
  // KEY_D ----------------------
  if(KEY_D == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_D", 10, 220);
  
  // KEY_F ----------------------
  if(KEY_F == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_F", 10, 240);
  
  // KEY_G ----------------------
  if(KEY_G == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("KEY_G", 10, 260);
  
  // Draw Spacebrew data
  fill(255);
  text("SB_RANGE", 10,300);
  fill(255, 0, 0);
  rect(0,310, SB_RANGE * width, 20);
  // SB_BUTTON_1 ----------------------
  if(SB_BUTTON_1 == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("SB_BUTTON_1", 10, 360);
  // SB_BUTTON_2 ----------------------
  if(SB_BUTTON_2 == 1.0){
    fill(255, 0, 0);
  }
  else{
    fill(255, 255, 255);
  }
  text("SB_BUTTON_2", 10, 380);
  
  
  // Use the different inputs to control the servo
  String currentInput = "";
  if(KEY_RETURN == 1 && !inputChanged){
    inputChanged = true;
    input ++;
    if(input > 13) input = 0;  
  }
  if(KEY_RETURN == 0.0){
    inputChanged = false;
  }
  switch (input){
    case 0:
      currentInput = "SONAR";
      SERVO = SONAR;
      break;
    case 1:
      currentInput = "KEY_LEFT";
      SERVO = KEY_LEFT;
      break;
    case 2:
      currentInput = "KEY_RIGHT";
      SERVO = KEY_RIGHT;
      break;
    case 3:
      currentInput = "KEY_UP";
      SERVO = KEY_UP;
      break;
    case 4:
      currentInput = "KEY_DOWN";
      SERVO = KEY_DOWN;
      break;
    case 5:
      currentInput = "KEY_SPACE";
      SERVO = KEY_SPACE;
      break;
    case 6:
      currentInput = "KEY_A";
      SERVO = KEY_A;
      break;
    case 7:
      currentInput = "KEY_S";
      SERVO = KEY_S;
      break;
    case 8:
      currentInput = "KEY_D";
      SERVO = KEY_D;
      break;
    case 9:
      currentInput = "KEY_F";
      SERVO = KEY_F;
      break;
    case 10:
      currentInput = "KEY_G";
      SERVO = KEY_G;
      break;
    case 11:
      currentInput = "SB_RANGE";
      SERVO = SB_RANGE;
      break;
    case 12:
      currentInput = "SB_BUTTON_1";
      SERVO = SB_BUTTON_1;
      break;
    case 13:
      currentInput = "SB_BUTTON_2";
      SERVO = SB_BUTTON_2;
      break;
  }
  
  fill(100, 100, 100);
  text("SERVO is currently being controlled by " + currentInput + ".", 10, 450);
  text("(Press Return to loop through the different inputs.)", 10, 470);
}

