class Bullet extends DisplayObject
{
  float radius;
  
  Bullet(Fighter _fighter){
    super();
    syurui = 1;
    position.x = _fighter.position.x + _fighter.size_x / 2;
    position.y = _fighter.position.y - radius;
    move.x = 0;
    move.y = -30;
    R = 255;
    G = 80;
    B = 0;
    radius = 8;
    HP = 1;

  }
  
  Bullet(Fighter _fighter, Enemy _enemy){
    super();
    syurui = 3;
    R = 255;
    G = 80;
    B = 0;
    HP = 1;
    radius = 8;
    
    float speed = 3;
    move = _fighter.position.copy().sub(_enemy.position.copy());
    move.normalize();
    move.mult(speed);
    
    position.x = _enemy.position.x + _enemy.size_x / 2;
    position.y = _enemy.position.y + _enemy.size_y;
  }
  
  
  void Draw()
  {
    super.Draw();

    fill(R, G, B);
    ellipse(position.x, position.y, radius / 2, radius);
    position.add(move);

  }
}
