color backgroundColor = color(255, 0, 0);
boolean space = false;
boolean click = false;

void setup(){
  // Define the size of our window to 500px x 500px
  size(500,500);
}

void draw(){
  background(backgroundColor);
  // Draws the ellipse in the mouse coordinates
  ellipse(mouseX, mouseY, 100, 100);
  
  println(key);
}

void keyPressed(){
  
 if (key == ' ') {
    // Check for exact moment the key changed from released to pressed
    if(space == false) {
      // If spacebar is pressed, change color to blue
      backgroundColor = color(0, 0, 255);
    }    
    space = true;
  }

}

void keyReleased(){
  
  if (key == ' ') {
    // WHen spacebar is released, back to red
    backgroundColor = color(255, 0, 0);
    space = false;
  }
 
}

void mousePressed(){
  backgroundColor = color(0, 255, 0);
}

void mouseReleased() {
  backgroundColor = color(255, 0, 0);
}
