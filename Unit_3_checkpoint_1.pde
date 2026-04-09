//Chris Richards
//Blk 2-1
//Mar 31.

//Pallette of colors
color black = #050505;
color green = #2DC123;
color blue = #44D1FA;
color yellow = #F0EA3A;
color pink = #FF8BD7;

color selectedColor;

void setup(){
  size (800,600);
  strokeWeight (3);
  stroke (black);
  selectedColor = green;
}

void draw() {
  background(pink);
  fill(green);
  ellipse (100,50,100,100);
  
  fill(blue);
  ellipse (100, 250, 100,100);
  
  fill(yellow);
  ellipse (100,450,100,100); 
  
  fill(selectedColor);
  rect(250,50,500,500);
  
  
  
  
  
  
}

void mouseReleased ()  {
  if (dist(100, 50, mouseX, mouseY) < 50) {
    selectedColor = green;
  }
}
