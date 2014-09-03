// import the audio library
import ddf.minim.*;

// create a instance of the Minim class,
// it will help us create the audio players
Minim minim;

// create the audio player for a specific key
AudioPlayer a_player;
AudioPlayer s_player;
AudioPlayer d_player;
AudioPlayer f_player;
AudioPlayer g_player;

// flags
boolean a = false;
boolean s = false;
boolean d = false;
boolean f = false;
boolean g = false;


void setup(){
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // load the sound files
  a_player = minim.loadFile("a.mp3");
  s_player = minim.loadFile("s.mp3");
  d_player = minim.loadFile("d.mp3");
  f_player = minim.loadFile("f.mp3");
  g_player = minim.loadFile("g.mp3");
  
  // loop everything
  a_player.loop();
  s_player.loop();
  d_player.loop();
  f_player.loop();
  g_player.loop();
  
  // start silent
  a_player.mute();
  s_player.mute();
  d_player.mute();
  f_player.mute();
  g_player.mute();
 
}

void draw(){
  if(KEY_A == 1) {
    a_player.unmute();
  } else {
    a_player.mute();
  }

  if(KEY_S == 1) {
    s_player.unmute();
  } else {
    s_player.mute();
  }

  if(KEY_D == 1) {
    d_player.unmute();
  } else {
    d_player.mute();
  }

  if(KEY_F == 1) {
    f_player.unmute();
  } else {
    f_player.mute();
  }

  if(KEY_G == 1) {
    g_player.unmute();
  } else {
    g_player.mute();
  }
  
}
