#include "Servo.h"

Servo servo;
int servoPin = 9;
int sonarPin = 8;
int servoDebugPin = 6;
int sonarDebugPin = 5;

float sonar = 0;
float angle = 0;

void setup() {
  Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
  pinMode(servoDebugPin, OUTPUT);
  pinMode(sonarDebugPin, OUTPUT);
  servo.attach(servoPin);
}

void loop() {
 
  // Receiving data...
    
  // Check if there is any bytes avaiable
  if (Serial.available() > 0) {
    // Read the incoming byte:
    char inByte = Serial.read();
    if(inByte < 128){
      // Write the value to an LED, for a quick debug
      analogWrite(servoDebugPin, map(inByte, 0, 127, 0, 255));
      
      // Convert the data to an angle
      angle = angle * 0.9 + (float)map(inByte, 0, 127, 0, 179) * 0.1;
      
      // Write it  to the servo
      servo.write(angle);
    }
    // Delay a bit so we don't jam the serial port
    delay(3);
  }

  
  // Sending data...
  
  // Read Sonar (send a pulse and do the reading)
  pinMode(sonarPin, OUTPUT);
  digitalWrite(sonarPin, LOW);
  delayMicroseconds(2);
  digitalWrite(sonarPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(sonarPin, LOW);
  pinMode(sonarPin, INPUT);
  
  float reading = pulseIn(sonarPin, HIGH, 2700);
  
  // If we don't get any data, assume highest value
  if(reading== 0) reading = 2700;
  
  // Smooth the sonar data
  sonar = sonar * 0.99 + reading * 0.01;  
  // Cap the edges and normalizing it to a value in the range 0 - 255
  float cappedSonar = sonar;
  if(sonar < 300) cappedSonar = 300;
  else if(sonar > 2700) cappedSonar = 2700;
  int out = map(cappedSonar, 300, 2700, 0, 255 );
  // Write the value to an LED, for a quick debug
  analogWrite(sonarDebugPin, out);
  // Send the sonar data
  Serial.write(out);
  Serial.flush();
  
  // Delay a bit so we don't jam the serial port
  delay(3);
}
