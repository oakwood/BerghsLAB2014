// import the audio library
import ddf.minim.*;

// create a instance of the Minim class,
// it will help us create the audio players
Minim minim;

// create the audio player
AudioPlayer player;

void setup(){
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // We won't use the Arduino, so disable it.
  // Your program will initialize much faster
  disableArduino = true;
  
  // load the sound files
  player = minim.loadFile("whip.mp3"); 
}

void draw(){
  // For the Spacebrew to work, you need to call
  // update() at the beggining of draw()
  update();
  
  background(0);
  if(SB_RANGE == 1){
    fill(255);
    textSize(32);
    text("Snap!", 10, 60);
    player.play(0); // pass 0 to always play from the beggining
  }
}
