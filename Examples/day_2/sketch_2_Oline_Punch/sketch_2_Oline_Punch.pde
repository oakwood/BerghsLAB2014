// Import the video library
import processing.video.*;

// A variable that will load the movie
Movie movie;

// A variable that will count our punches
int count = 0;

// A variable that will help us figure out
// if the punch has just happened
boolean bang = false;

void setup(){
  // Set the screen size
  size(480, 480);
  
  // We won't use the Arduino, so disable it.
  // Your program will initialize much faster
  disableArduino = true;
  
  // Load the movie file
  movie = new Movie(this, "punch.mov");
  movie.loop();
}

void draw(){
  // For the Spacebrew to work, you need to call
  // update() at the beggining of draw()
  update();
  
  if(movie.available()){
    // Change the position according to the SB_RANGE.
    // Invert the SB_RANGE values, so it increases as we get
    // closer to it.
    float senconds = (SB_RANGE * 0.95) * movie.duration();
    
    movie.jump(senconds);
    movie.read();
  }
  
  // Count the punches..
  
  // Check if SB_RANGE value is large, and if the punch
  // has just started ("bang" needs to be true)
  // (Use Accelerometer Y as your data source)
  if(SB_RANGE > 0.8 && bang){
    // increase the count
    count++;
    // set bang to false, so we don't keep adding
    bang = false; 
  }
  // If SB_RANGE value is small, set bang to true
  if(SB_RANGE < 0.8){
    bang = true;
  }
  
  // Draw the movie on to the screen
  image(movie, 0, 0);
  
  // Draw the count
  textSize(40);
  text(count, 20, 50);
}
