class Enemy extends DisplayObject
{
  float size_x, size_y;

  Enemy() {
    super();
    syurui = 2;
    size_x = 30;
    size_y = 9;
    HP = (int)random(1, 10);
    R = 204;
    G = 204;
    B = 204;
    position.x = random(0, width);
    position.y = 30;
    move.x = random(-1, 1);
    move.y = random(0.1, 1);
  }

  void Draw()
  {
    super.Draw();

    if (position.x < 0 || position.x > width - size_x)
      move.x = -move.x;
    if( position.y < 30)
      move.y = -move.y;
    
    colorMode(HSB);
    fill((HP % 10) * 25, 255, 255);

    textSize(15);
    text(HP, position.x + 10, position.y - 20);
    
    colorMode(RGB);

    fill(R, G, B);
    arc(position.x + size_x / 2, position.y, size_x, size_x, PI, TWO_PI);
    rect(position.x, position.y, size_x, size_y);
    arc(position.x, position.y + size_y / 2, size_y , size_y, PI / 2, PI * 3 / 2);
    arc(position.x + size_x, position.y + size_y / 2, size_y, size_y, PI * 3 / 2, TWO_PI);
    arc(position.x + size_x, position.y + size_y / 2, size_y, size_y, 0, PI / 2);
    fill(R, G, 0);
    ellipse(position.x + 5, position.y + size_y * 1.1, 10, 10);
    ellipse(position.x + 15, position.y + size_y * 1.1, 10, 10);
    ellipse(position.x + 25, position.y + size_y * 1.1, 10, 10);


    position.add(move);

  }
}
