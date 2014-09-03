// import the audio library
import ddf.minim.*;

// flag to know if the key was pressed or not
boolean space = false;

// create a instance of the Minim class,
// it will help us create the audio players
Minim minim;

// create the audio player
AudioPlayer player;

void setup(){
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // load the sound files
  player = minim.loadFile("yeah.mp3"); 
}

void draw(){
  background(0);
  if(KEY_SPACE == 1){
    fill(255);
    textSize(32);
    text("Yeah!", 10, 60);
    player.play(0); // pass 0 to always play from the beggining
  }
}