class Catcher {
  int diam;
  PVector loc;

  Catcher(int tDiam) {
    loc = new PVector(mouseX, mouseY);
    diam= tDiam;
  }

  void display() {
    fill(0);
    ellipse(loc.x, loc.y, diam, diam);
  }
  void update() {
    loc.set(mouseX, mouseY);
  }
}