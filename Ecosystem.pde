ArrayList<Blob> blobs = new ArrayList();
ArrayList<Blue> blues = new ArrayList();
ArrayList<Red> reds = new ArrayList();
ArrayList<Food> foods = new ArrayList();
String mode = "";

public void setup() {
  size(900, 900);
}

public void draw() {
  background(200);
  
  ArrayList<Blue> blueBabies = new ArrayList();
  ArrayList<Red> redBabies = new ArrayList();
  
  for (Blue blue : blues) {
    if (blue.isActive()) {
      for (Red red : reds) {
        if (red.isActive()) { 
          blue.fight(red);
        }
      }
      Blue maybeBaby = (Blue) blue.reproduce();
      if (maybeBaby != null) {
        blueBabies.add(maybeBaby);
        blobs.add(maybeBaby);
      }
    }
  }
  
  for (Red red : reds) {
    Red maybeBaby = (Red) red.reproduce();
      if (maybeBaby != null) {
        redBabies.add(maybeBaby);
        blobs.add(maybeBaby);
      }
  }
  
  for (Blue baby : blueBabies) {
    if (baby != null) blues.add(baby);
  }
  for (Red baby : redBabies) {
    if (baby != null) reds.add(baby);
  }
  
  for (Blob blob : blobs) {
    if (!blob.isActive()) continue;

    for (Food food : foods) {
      blob.blobVsFood(food);
    }

    blob.move();
    blob.draw();
  }
  for (Food food : foods) {
    if (!food.isActive()) continue;

    food.draw();
  }

  takeOutTheTrash();
}

private void takeOutTheTrash() {
  ArrayList<Blob> trash = new ArrayList();
  for (Blob blob : blobs) {
    if (!blob.isActive()) trash.add(blob);
  }
  blobs.remove(trash);

  ArrayList<Food> trashFood = new ArrayList();
  for (Food food : foods) {
    if (!food.isActive()) trashFood.add(food);
  }
  foods.remove(trashFood);
}

//1. Spawn Reds and Blues, not Blobs
public void mouseReleased() {
  if (mode.equals("blue")) {
    //polymorphism
    Blob newBlob = new Blue(mouseX, mouseY);
    blobs.add(newBlob);
    blues.add( (Blue) newBlob);
  } else if (mode.equals("red")) {
    Blob newBlob = new Red(mouseX, mouseY);
    blobs.add(newBlob);
    reds.add( (Red) newBlob);
  } else if (mode.equals("food")) {
    Food newFood = new Food(mouseX, mouseY);
    foods.add(newFood);
  }
}

public void keyPressed() {
  if (keyCode == 70) {
    mode = "food";
  } else if (keyCode == 82) {
    mode = "red";
  } else if (keyCode == 66) {
    mode = "blue";
  }
}
