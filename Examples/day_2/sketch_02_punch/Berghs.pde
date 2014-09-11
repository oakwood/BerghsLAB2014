float KEY_LEFT = 0.0;
float KEY_RIGHT = 0.0;
float KEY_UP = 0.0;
float KEY_DOWN = 0.0;
float KEY_A = 0.0;
float KEY_S = 0.0;
float KEY_D = 0.0;
float KEY_F = 0.0;
float KEY_G = 0.0;
float KEY_SPACE = 0.0;
float KEY_RETURN = 0.0;
float SONAR = 0.0;
float SB_BUTTON = 0.0;
float SB_BUTTON_1 = 0.0;
float SB_BUTTON_2 = 0.0;
float SB_RANGE = 0.0;
float SERVO = 0.0;

boolean disableArduino = false;

int frame = 0;
void update() {
  if(frame == 0){
    // setup
    sbSetup();
  }
  frame++;
  
  sbUpdate();
  
  if(disableArduino) return;
  
  // Read SONAR from arduino
  // Send SERVO to arduino
  if(arduinoUpdate()){  
    char inByte = port.readChar();
    port.clear();
    if(inByte < 266){
      SONAR = map(inByte, 0, 255, 0, 1);
    }
    port.write((char)(SERVO * 127));
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      KEY_LEFT = 1.0;
    }
    else if (keyCode == RIGHT) {
      KEY_RIGHT = 1.0;
    }
    else if (keyCode == UP) {
      KEY_UP = 1.0;
    }
    else if (keyCode == DOWN) {
      KEY_DOWN = 1.0;
    }
  }
  else if (key == 'a') {
    KEY_A = 1.0;
  }
  else if (key == 's') {
    KEY_S = 1.0;
  }
  else if (key == 'd') {
    KEY_D = 1.0;
  }
  else if (key == 'f') {
    KEY_F = 1.0;
  }
  else if (key == 'g') {
    KEY_G = 1.0;
  }
  else if (key == ' ') {
    KEY_SPACE = 1.0;
  }
  else if (key == ENTER || key == RETURN) {
    KEY_RETURN = 1.0;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      KEY_LEFT = 0.0;
    }
    else if (keyCode == RIGHT) {
      KEY_RIGHT = 0.0;
    }
    else if (keyCode == UP) {
      KEY_UP = 0.0;
    }
    else if (keyCode == DOWN) {
      KEY_DOWN = 0.0;
    }
  }
  else if (key == 'a') {
    KEY_A = 0.0;
  }
  else if (key == 's') {
    KEY_S = 0.0;
  }
  else if (key == 'd') {
    KEY_D = 0.0;
  }
  else if (key == 'f') {
   KEY_F = 0.0;
  }
  else if (key == 'g') {
    KEY_G = 0.0;
  }
  else if (key == ' ') {
    KEY_SPACE = 0.0;
  }
  else if (key == ENTER || key == RETURN) {
    KEY_RETURN = 0.0;
  }
}

///////////////////////////////////////////////////////
// ARDUNINO CONNECTION ////////////////////////////////
///////////////////////////////////////////////////////
import processing.serial.*;

Serial port;
int arduinoMissedAttempts = 0;
int arduinoMissedMessages = 100;
String arduinoPortName = "";
boolean arduinoGaveUp = false;

boolean arduinoUpdate(){
  if(arduinoGaveUp) return false;
  
  boolean connected = true;
  if(arduinoMissedMessages > 60){
    connected = false;
    connected = connectToArduino();
    if(connected) {
      arduinoMissedMessages = 0;
      arduinoMissedAttempts = 0;
    }
    else arduinoMissedAttempts++;
    if(arduinoPortName.isEmpty() && arduinoMissedAttempts > 1){
      arduinoGaveUp = true;
    }
  }
  if(port.available() > 0){
    arduinoMissedMessages = 0;
  }
  else arduinoMissedMessages++;
  
  return connected;
}
boolean connectToArduino(){
  
  
  if(!arduinoPortName.isEmpty()){
    try{
      port = new Serial(this, arduinoPortName, 9600);
      println("Reconnected to Arduino!");
      return true;
    }
    catch(RuntimeException e){
      return false;
    }
  }
  
  print("Searching for an Arduino...");
  
  for (int  i = Serial.list().length -1; i >= 0 ; i--) { 
    //print("Testing port " + Serial.list()[i] + "...");
    print(".");
    try{
      port = new Serial(this, Serial.list()[i], 9600); 
      //println(" Sucess opening.");
    }
    catch(RuntimeException e){
      //println(" Can't open.");
      continue;
    }
    delay(1800);
    
    port.clear();    // empty buffer(incase of trash) 
    port.buffer(1);
    
    // Montior the port for a little while, if there is data comming
    // constantly, assume it is the arduino port
    int messages = 0;
    for(int j = 0; j < 5; j++){
      delay(30);
      if(port.available() > 0){
        messages++;
        port.clear();
      }
    }
    //println("  Received " + messages + " messages.");
    if(messages == 5){
      arduinoPortName = Serial.list()[i];
      println(" Connected!");
      return true;
    }
    
    port.stop();
  } 
  println(" Not found!");
  return false;
}

void delay(int milliseconds){
  int time = millis();
  while(millis() - time <= milliseconds);
}

///////////////////////////////////////////////////////
// SPACEBREW CONNECTION ///////////////////////////////
///////////////////////////////////////////////////////
import spacebrew.*;
import java.net.*;
Spacebrew sb;
String sbName;
boolean sbDidConnectionMessage = false;
int sbConnectionThrottle = 0;
boolean sbIsConnected = false;

void sbSetup(){
  // instantiate the spacebrewConnection variable
  sb = new Spacebrew( this );
  // declare your subscribers
  sb.addSubscribe( "button 1", "boolean", "onButton1" );
  sb.addSubscribe( "button 2", "boolean", "onButton2" );
  sb.addSubscribe( "range", "range", "onRange");
  
  // Get a username for spacebrew, from the system user
  sbName = System.getProperty("user.name");
  
  // Check if int
}

void sbUpdate(){
  sbConnectionThrottle++;
  if(sbConnectionThrottle % 1000 != 1) return;

  boolean internet = isHostUp("ws://spacebrew.herokuapp.com:80");
  if(!internet) {
    sbIsConnected = false;
    if(!sbDidConnectionMessage){
      sbDidConnectionMessage = true;
      println("Couldn't connect to Spacebrew.");
    }
    return;
  }
  if(sbIsConnected) {
    sbDidConnectionMessage = false;
    return;
  }
   

  sb.connect( "ws://spacebrew.herokuapp.com:80", sbName, "Berghs" );
  println("Connected to Spacebrew as \"" + sbName + "\".");
  sbIsConnected = true;
  sbDidConnectionMessage = false;

}
void onRange( int value ){
   SB_RANGE = (float) value / 1024.0;
}
void onButton1( boolean value ){
   SB_BUTTON = (value) ? 1 : 0;
   SB_BUTTON_1 = (value) ? 1 : 0;
}
void onButton2( boolean value ){
   SB_BUTTON_2 = (value) ? 1 : 0;
}

public static boolean isHostUp(String host){
    try {
        //make a URL to a known source
        URL url = new URL(host);

        //open a connection to that source
        HttpURLConnection urlConnect = (HttpURLConnection)url.openConnection();
        urlConnect.setConnectTimeout(1000);

        //trying to retrieve data from the source. If there
        //is no connection, this line will fail
        Object objData = urlConnect.getContent();

    } catch (UnknownHostException e) {
        // TODO Auto-generated catch block
        //e.printStackTrace();
        return false;
    }
    catch (IOException e) {
        // TODO Auto-generated catch block
       // e.printStackTrace();
        return false;
    }
    return true;
}
