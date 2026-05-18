//Chris richards
//Blk 2

color lightGreen = #17E01E;
color red        = #F51111;
color blue       = #0B80DE;
color yellow     = #F5D51E;
color pink       = #F702CB;
color orange     = #FF9203;
color lightBlue  = #03FCF6;
color purple     = #6907F5;
color grey       = #B7B7B7;
color white      = #FCFFFD;

color currentColor = #050505;
float brushSize;

boolean circleStamp = false;
boolean rectStamp = false;

int sliderX = 500;
int sliderY = 700;
int sliderW = 200;
int knobX = 600;

void setup() {
size(800, 800);
background(255);
brushSize = 5;
}

void draw() {
drawToolbar();
drawIndicator();
drawSlider();
drawStampButtons();
drawControlButtons();
}

void mousePressed() {
if (dist(mouseX, mouseY, 50, 650) < 45) { currentColor = lightGreen; turnOffStamps(); }
if (dist(mouseX, mouseY, 150, 650) < 45) { currentColor = red; turnOffStamps(); }
if (dist(mouseX, mouseY, 250, 650) < 45) { currentColor = blue; turnOffStamps(); }
if (dist(mouseX, mouseY, 350, 650) < 45) { currentColor = yellow; turnOffStamps(); }
if (dist(mouseX, mouseY, 50, 750) < 45) { currentColor = pink; turnOffStamps(); }
if (dist(mouseX, mouseY, 150, 750) < 45) { currentColor = orange; turnOffStamps(); }
if (dist(mouseX, mouseY, 250, 750) < 45) { currentColor = lightBlue; turnOffStamps(); }
if (dist(mouseX, mouseY, 350, 750) < 45) { currentColor = purple; turnOffStamps(); }

if (mouseX > 500 && mouseX < 600 && mouseY > 620 && mouseY < 670) {
circleStamp = !circleStamp;
rectStamp = false;

}
if (mouseX > 620 && mouseX < 720 && mouseY > 620 && mouseY < 670) {
rectStamp = !rectStamp;
circleStamp = false;
}

if (mouseX > 500 && mouseX < 620 && mouseY > 750 && mouseY < 790) {
background(255);
}

if (mouseY < 600) {
fill(currentColor);
noStroke();
if (circleStamp) {
ellipse(mouseX, mouseY, brushSize * 5, brushSize * 5);
} else if (rectStamp) {
rectMode(CENTER);
rect(mouseX, mouseY, brushSize * 5, brushSize * 5);
rectMode(CORNER);
}
}
}

void mouseDragged() {
if (dist(mouseX, mouseY, knobX, sliderY) < 30) {
knobX = mouseX;
knobX = constrain(knobX, sliderX, sliderX + sliderW);
}

if (mouseY < 600 && !circleStamp && !rectStamp) {
stroke(currentColor);
strokeWeight(brushSize);
line(pmouseX, pmouseY, mouseX, mouseY);
}
}

void drawToolbar() {
noStroke();
fill(240);
rect(0, 600, 800, 200);

circleButton(lightGreen, 50, 650, 45);
circleButton(red, 150, 650, 45);
circleButton(blue, 250, 650, 45);
circleButton(yellow, 350, 650, 45);
circleButton(pink, 50, 750, 45);
circleButton(orange, 150, 750, 45);
circleButton(lightBlue, 250, 750, 45);
circleButton(purple, 350, 750, 45);
}

void circleButton(color c, int x, int y, int r) {
if (dist(mouseX, mouseY, x, y) < r) {
stroke(255);
strokeWeight(5);
} else {
stroke(0);
strokeWeight(2);
}
fill(c);
ellipse(x, y, r * 2, r * 2);
}

void rectButton(color c, int x, int y, int w, int h) {
if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
stroke(255);
strokeWeight(4);
} else {
stroke(0);
strokeWeight(2);
}
fill(c);
rect(x, y, w, h);
}

void drawSlider() {
stroke(0);
strokeWeight(3);
line(sliderX, sliderY, sliderX + sliderW, sliderY);

if (dist(mouseX, mouseY, knobX, sliderY) < 15) {
fill(200);
} else {
fill(255);
}
stroke(0);
ellipse(knobX, sliderY, 25, 25);
brushSize = map(knobX, sliderX, sliderX + sliderW, 1, 50);
}

void drawIndicator() {
fill(currentColor);
stroke(0);
strokeWeight(2);
ellipse(750, 700, brushSize, brushSize);
}

void drawStampButtons() {
if (circleStamp) {
rectButton(color(200), 500, 620, 100, 50);
} else {
rectButton(255, 500, 620, 100, 50);
}
fill(0);
ellipse(550, 645, 25, 25);

if (rectStamp) {
rectButton(color(200), 620, 620, 100, 50);
} else {
rectButton(255, 620, 620, 100, 50);
}
fill(0);
rect(655, 632, 30, 25);
}

void drawControlButtons() {
rectButton(grey, 500, 750, 120, 40);
fill(0);
textSize(20);
text("NEW", 535, 777);
}

void turnOffStamps() {
circleStamp = false;
rectStamp = false;
}
