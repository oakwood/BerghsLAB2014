// Import sound library
import ddf.minim.*;
Minim minim;
// create the audio player
AudioPlayer player;

// Variables for score value
int score = 0;

boolean gameOver = false;
boolean left = false;
boolean right = false;

void setup() {
  size(600, 400);
  score = width / 2;
  background( 255 );
   
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
  
  if(KEY_LEFT == 1 && left == false) {
    score += 5;
    left = true;
  }

  if(KEY_RIGHT == 1 && right == false) {
    score -= 5;
    right = true;
  }

  if(KEY_RIGHT == 0) {
    right = false;
  }

  if(KEY_LEFT == 0) {
    left = false;
  }
}
