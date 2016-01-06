class Raindrop {
  PVector loc, vel, acc;
  float diam;
  PImage trash;

  Raindrop(float x, float y) {
    loc = new PVector(x, y);
    vel =new PVector(random(0, 2), random(0, 2));
    acc= new PVector(0.0001, .00002);
    diam = 30;
    trash = loadImage("trash.jpg");
  }

  void display() {
    image(trash, loc.x, loc.y);
   
  }

  void fall() {
    loc.y = loc.y + vel.y;
    vel.add(acc);
  }

  void reset() {
    loc.y = 0; 
    vel.set(0, 9);
  }

  boolean isInContactWith(Catcher bucket) {
    float d = loc.dist(bucket.loc);
    boolean e;
    if (d< diam/2+ bucket.diam) {
      e = true ;
    } else {
      e = false;
    }
    return e;
  }
}