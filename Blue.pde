public class Blue extends Blob {
  public Blue(int x, int y) {
    super(x, y, #0000FF, 25); 
  }
  
  //2.2 if blue collides with red, the weaker one loses 50 hp
  public void fight(Red red) {
    //use code from Blob.blobVsFood()
    if (dist(super.getX(),super.getY(),red.getX(),red.getY()) < (super.getSize() + red.getSize())/2.0) {
      if (red.getHp() < super.getHp()) {
        red.damage(50);
      }
      else if (red.getHp() > super.getHp()) {
        super.damage(50);
      }
      else if (Math.abs(red.getHp() - super.getHp()) < 1e-6) {
        super.damage(25);
        red.damage(25);
      }
    }
  }
}
