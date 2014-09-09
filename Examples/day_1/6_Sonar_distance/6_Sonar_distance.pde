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
  
  // Load the movie file
  movie = new Movie(this, "punch.mov");
  movie.play();
}

void draw(){
  // For the Arduino to work, you need to call
  // update() at the beggining of draw()
  update();
  
  if(movie.available()){
    // Change the position according to the SONAR.
    // Invert the SONAR values, so it increases as we get
    // closer to it.
    float senconds = (1 - SONAR) * movie.duration();
    
    movie.jump(senconds);
    movie.read();
  }
  
  // Count the punches..
  
  // Check if SONAR value is small, and if the punch
  // has just started ("bang" needs to be true)
  if(SONAR < 0.2 && bang){
    // increase the count
    count++;
    // set bang to false, so we don't keep adding
    bang = false; 
  }
  // If SONAR value is large, set bang to true
  if(SONAR > 0.2){
    bang = true;
  }
  
  // Draw the movie on to the screen
  image(movie, 0, 0);
  
  // Draw the count
  textSize(40);
  text(count, 20, 50);
}
