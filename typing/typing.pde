String text = "sample";
int[] fontSizes = new int[999];

int minFontSize = 15;
int maxFontSize = 800;
int newFontSize = 0;

float spacing = 0;

float maxDTime = 5000; 

PFont font;

float pMillis = 0;

void setup(){
  size(1000, 1000);
  font = loadFont("ArialMT-255.vlw");
  //font = loadFont("Apple-Chancery-255.vlw");
  for(int i=0; i<text.length(); i++){
    fontSizes[i] = minFontSize;
  }
}

void draw(){
  background(255);
  fill(0);
  
  spacing = map(mouseY, 0, height, 0, 120);
  
  push();
  translate(0, 200);
  
  float x = 0;
  float y = 0;
  
  for(int i=0; i<text.length(); i++){
    int fontSize = fontSizes[i];
    textFont(font, fontSize);
    char letter = text.charAt(i);
    float letterWidth = textWidth(letter);
    
    if(x + letterWidth > width){
      x = 0;
      y += spacing;
    }
    
    text(letter, x, y);
    
    x += letterWidth-3;
  }
  
  float dTime = millis() - pMillis;
  newFontSize = (int)map(dTime, 0, maxDTime, minFontSize, maxFontSize);
  newFontSize = min(newFontSize, maxFontSize);
  
  rect(x, y, newFontSize / 2, newFontSize / 20);
  pop();
}

void keyPressed(){
  if(keyCode == 32){
    text += key;
    fontSizes[text.length()-1] = 10;
  }else if(keyCode > 32){
    text += key;
    fontSizes[text.length()-1] = newFontSize;
  }
  
  pMillis = millis();
}
