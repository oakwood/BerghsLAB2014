// import the audio library
import ddf.minim.*;

// create a instance of the Minim class,
// it will help us create the audio players
Minim minim;

// create the audio player
AudioPlayer yeah;
AudioPlayer error;

// Flag if left or right keys are pressed
boolean left = false;
boolean right = false;

void setup(){
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // load the sound files
  yeah = minim.loadFile("yeah.mp3"); 
  error = minim.loadFile("error.mp3");
}

void draw(){
  background(0);
  
  if(space){
    fill(255);
  }
}

void keyPressed(){
  
    if (keyCode == LEFT && left == false) { 
      yeah.play();
      left = true;
    }
  
    else if (keyCode == RIGHT && right == false) {    
      error.loop();
      right = true;
    }

}

void keyReleased(){
  
    if (keyCode == LEFT && left == true) { 
      yeah.pause();
      yeah.rewind();
      left = false;
    }
  
    else if (keyCode == RIGHT && right == true) {    
      error.pause();
      error.rewind();
      right = false;
    }
    
}

