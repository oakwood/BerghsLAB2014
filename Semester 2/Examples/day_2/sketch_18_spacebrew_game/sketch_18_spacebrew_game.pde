String server="sandbox.spacebrew.cc";
String name = "Red and Blue Game";
String description = "";

// Import sound library
import ddf.minim.*;
Minim minim;
// create the audio player
AudioPlayer player;
// Import spacebrew library
import spacebrew.*;
Spacebrew sb;
// Variables for score value
int score = 0;

boolean gameOver = false;

void setup() {
  size( 600, 400 );
  score = width / 2;
  background( 255 );
  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );
  // declare your subscribers
  sb.addSubscribe( "red", "boolean", "onRed" );
  sb.addSubscribe( "blue", "boolean", "onBlue" );
  // connect to spacebre
  sb.connect( server, name, description );
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // load the sound files
  player = minim.loadFile("yeah.mp3"); 
}

void draw() {
  if( gameOver == false ) {
    fill( 255, 0, 0 );
    rect( 0, 0, score, height );
    fill( 0, 0, 255 );
    rect( score, 0, width-score, height );
    if( score > width || score < 0 ) {
      player.play(0);
      gameOver = true;
    }
  }
}

void onRed(boolean msg) {
  score+=2;
}

void onBlue(boolean msg) {
  score-=2;
}
