class Buddy extends Fighter
{
  
  Buddy(){
    super();
    syurui = 6;
    position.x = random(0, width);
    position.y = height - 80;
    move.x = random(-2,2);
    move.y = random(-1,1);
    HP = 10;
    R = (int)random(255);
    G = (int)random(255);
    B = (int)random(255);
  }
  
  void Draw()
  {
    if (position.x < 0 || position.x > width - size_x)
      move.x = -move.x;
    if(position.y > height || position.y <= height / 2)
      move.y = -move.y;
    
    fill(R, G, B);
    
    rect(position.x, position.y, size_x, size_y);
    triangle(position.x - size_x, position.y + size_y * 0.9, position.x + size_x / 2, position.y, position.x + size_x / 2, position.y + size_y * 0.9);
    triangle(position.x + size_x / 2, position.y + size_y * 0.9, position.x + size_x / 2, position.y, position.x + size_x * 2, position.y + size_y * 0.9);
    arc(position.x + size_x / 2, position.y, size_x, size_x, PI, TWO_PI);
    fill(170,255,221);
    ellipse(position.x + size_x / 2, position.y + size_x / 2, 6, 15);
    
    noFill();
    
    if(random(512) < 64)
      objects.add(new Bullet(this));
    
    position.add(move);
  }
}
