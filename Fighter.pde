class Fighter extends DisplayObject
{
  int size_x, size_y;
  int moveDirection;

  Fighter() {
    super();
    syurui = 0;
    size_x = 10;
    size_y = 30;
    position.x = (width / 2) - (size_x / 2);
    position.y = height - 80;
    move.x = 15;
    move.y = 0;
    R = 255;
    G = 255;
    B = 255;
    HP = 20;
    moveDirection = 0;
  }

  void Draw()
  {
    super.Draw();
    fill(204);
    //position.x = move.x * moveDirection + position.x;

    position.x = mouseX;
    position.y = mouseY - 30;

    if (position.x <= 0)
      position.x = 0;
    if (position.x > width - size_x)
      position.x = width - size_x;
    if (position.y <= 30)
      position.y = 30;
    if (position.y > height - size_y)
      position.y = height - size_y;



    rect(position.x, position.y, size_x, size_y);
    triangle(position.x - size_x, position.y + size_y * 0.9, position.x + size_x / 2, position.y, position.x + size_x / 2, position.y + size_y * 0.9);
    triangle(position.x + size_x / 2, position.y + size_y * 0.9, position.x + size_x / 2, position.y, position.x + size_x * 2, position.y + size_y * 0.9);
    arc(position.x + size_x / 2, position.y, size_x, size_x, PI, TWO_PI);
    fill(170, 255, 221);
    ellipse(position.x + size_x / 2, position.y + size_x / 2, 6, 15);
    fill(R, G, B);

    textSize(30);
    fill(fighter.R, fighter.G, fighter.B);
    text("HP " + fighter.HP, width - 120, 30);
    text("Score " + score, 10, 30);
  }
}
