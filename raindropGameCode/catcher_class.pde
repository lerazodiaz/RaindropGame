class Catcher {    //create catcher class
  int diam;    
  PVector loc;

  Catcher(int tDiam) {
    loc = new PVector(mouseX, mouseY);
    diam= tDiam;
  }

  void display() {    //display function to use w/in catcher class
    fill(178, 175, 214);
    ellipse(loc.x, loc.y, diam, diam);
  }
  void update() {      //update function to use w/in catcher class
    loc.set(mouseX, mouseY);
  }
}