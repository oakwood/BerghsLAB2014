// import the audio library
import ddf.minim.*;

// create a instance of the Minim class,
// it will help us create the audio players
Minim minim;

// create the audio player
AudioPlayer player;

void setup(){
  // Set the screen size, on this case fullscreen
  size(displayWidth, displayHeight);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // load the sound file
  player = minim.loadFile("alarm.mp3");
  
  // loop
  player.loop();
  
  // start silent
  player.mute();
}

void draw(){
  // For the Arduino to work, you need to call
  // update() at the beggining of draw()
  update();
  
  // Use the number to change the sensibility.
  if(SONAR < 0.5) {
    // Unmute the sound if we are close enough
    player.unmute();
    
    // Flash the screen with random red colors
    background(random(255), 0, 0);
  } else {
    // Silence if we are far
    player.mute();
    
    // Black screen
    background(0, 0, 0);
  }
}
