public class Blob extends Entity {
  //fields
  private float ax, ay, vx, vy, speed, hp;
  //constructor
  public Blob(int x, int y, color c, int size) {
    super(x, y, c, size);
    speed = random(0,0.3);
    hp = 100.0;
  }
  //methods
  public void move() {
    hp -= 0.2;
    
    if (hp <= 0.0) {
      super.setActive(false); 
    }
    
    ax = random(-speed,speed);
    ay = random(-speed,speed);
    
    vx += ax;
    vy += ay;
    
     super.setX( (int) (super.getX() + vx) );
     super.setY( (int) (super.getY() + vy) );
  }
  
  private void eat(Food food) {
    hp += 20;
    food.setActive(false);
  }
  
  public void blobVsFood(Food food) {
    if (dist(super.getX(),super.getY(),food.getX(),food.getY()) < (super.getSize() + food.getSize())/2.0) {
      System.out.println("ate food");
      eat(food);
    }
  }
  //getters and setters
  
}
