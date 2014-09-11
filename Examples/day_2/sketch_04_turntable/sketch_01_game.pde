// A variable that will hold the SERVO position
float position = 0.5;

// Flags that will control if the buttons are
// being pressed properly.
boolean bangLeft = false;
boolean bangRight = false;

void setup(){
  size(500,500);
}

void draw(){
  // For the Arduino to work, you need to call
  // update() at the beggining of draw()
  update();
  
  // Check if KEY_LEFT is pressed
  if(KEY_LEFT == 1.0 && bangLeft){
    // decrease the position
    position -= 0.01;
    bangLeft = false; 
  }
  if(KEY_LEFT == 0.){
    bangLeft = true;
  }
  
  // Check if KEY_RIGHT is pressed
  if(KEY_RIGHT == 1.0 && bangRight){
    // increase the position
    position += 0.01;
    bangRight = false; 
  }
  if(KEY_RIGHT == 0.){
    bangRight = true;
  }
  
  // Keep the position in the boundaries
  if(position < 0){
    position = 0;
  }
  else if(position > 1){
    position = 1;
  }
  
  // Set the SERVO position
  SERVO = position;
  
  // Draw the position to the screen
  background(0);
  ellipse(position * width, height / 2, 50, 50);
  
  // Color the screen if left or right wins
  if(position == 0){
    background(255, 0, 0);
  }
  else if(position == 1){
    background(0, 255, 0);
  }
}
