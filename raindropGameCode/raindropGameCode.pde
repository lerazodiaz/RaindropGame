PImage beach;
PVector mouse;   //declare a P
int count = 100;
//Raindrop [] r = new Raindrop[count];      //declare a new Raindrop called r
ArrayList<Raindrop> drops = new ArrayList<Raindrop>();    //declare & initialize Array list
Catcher c;
int score;
float start;


// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  start = 1; 
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  c= new Catcher(100);
  beach = loadImage ("beach.jpg");
  drops.add(new Raindrop(mouseX, mouseY));
}


void draw() {    //startscreen 
  if (start==1) {
    background(207, 87, 110);
    textSize(40);
    text("Clean Up the Beach!", width/2, 200);
    text("Click the Mouse to Start", width/2-100, 300);
    if (mousePressed == true) {
      start = 2;
    }
  }
  if (start == 2) {
    game();
  }
}


void game() {

  textSize(32);    //text size
  text("Clean the Beach", width/2, height/2);
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(63, 83, 87);
  image(beach, 0, 0);

  drops.add(new Raindrop(mouseX, mouseY));

  for (int i = drops.size()-1; i >= 0; i--) {
    Raindrop r = drops.get(i);
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.reset();                         //if it is, reset the raindrop
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.reset();                           //if it does, reset the raindrop
      score+=1;      // add 1 to score
    }
  }
  c.display();
  c.update();
  textSize(32);
  fill(0);
  text(score, width/2, 700);
  if (score > 150) {    //when score is more than 100
    gamedone(); //
  }
}

void gamedone() {
  background (0);
  textSize(45);
  fill(255);
  text("You failed to clean up the beach.", 50, height/2);
}