class Catcher {
  int diam;
  PVector loc;

  Catcher(int tDiam) {
    loc = new PVector(mouseX, mouseY);
    diam= tDiam;
  }

  void display() {
    fill(178,175,214);
    ellipse(loc.x, loc.y, diam, diam);
  }
  void update() {
    loc.set(mouseX, mouseY);
  }
}