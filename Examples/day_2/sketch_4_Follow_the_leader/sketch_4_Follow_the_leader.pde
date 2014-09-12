// Variable that will hold the frame number
int frameNumber = 0;
int gameDuration = 0;

// Variable that will hold our points
int points = 0;

// Variable that tells if the player needs to
// stand-up (1) or sit-down (0).
int position = 1;

void setup(){
  size(500,500);
  disableArduino = true;
}

void draw(){
  // For the Spacebrew and Arduino to work, you need to call
  // update() at the beggining of draw()
  update();
  
  
  // Count the number of frames
  frameNumber++;
  // Everytime we get to 300 frames randomize the position
  // and reset the frame count
  if(frameNumber > 100){
    position = (int)random(2);
    frameNumber = 0;
  }
  
  // Calculate the points, if positon is 1 (sitting down),
  // SB_RANGE needs to be larger than the threshold value.
  // If position is 2 (standing up), SB_RANGE needs to be
  // smaller than the threshold value.

  // tip: Print SB_RANGE so we can figure out the correct threshold
  // (use Gyroscope Alpha as your data source)
  println(SB_RANGE); 
  float threshold = 0.25;
  if(position == 0 && SB_RANGE > threshold){
    points++;
  }
  else if(position == 1 && SB_RANGE < threshold){
    points++;
  }
  if(position == 0 && SB_RANGE < threshold){
    points -= 2; // same as points = points - 2;
  }
  else if(position == 1 && SB_RANGE > threshold){
    points -= 2; // same as points = points - 2;
  }
  
  
  // Draw the instructions to the screen
  textSize(300);
  if(position == 0){
    background(255,0, 0);
    text("↓", 170, 350 );
  }
  else if(position == 1){
    background(0,255, 0);
    text("↑", 170, 350 );
  }
  else  background(0,0, 0);
  
  // Draw the points to the screen
  textSize(30);
  String pointsMessage = "Points: " + points;
  text(pointsMessage, 30, 70 );
  
  
  // After 2000 frames, restart game
  gameDuration++;
  if(gameDuration == 1999){
    background(0,0, 0);
    text(pointsMessage, 30, 70 );
  }
  if(gameDuration == 2000){
    gameDuration = 0;
    points = 0;
    frameNumber = 0;
    delay(5000);
  }
}

