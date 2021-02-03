public class Red extends Blob {
  public Red(int x, int y) {
    super(x, y, #FF0000, 20);
  }
  
  public Blob reproduce() {
    Blob baby = null;
    if (Math.random() < (0.1 / frameRate)) {
       baby = new Red(super.getX(), super.getY());
    }
    return baby;    
  }
}
