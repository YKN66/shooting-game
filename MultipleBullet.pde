class MultipleBullet extends Bullet
{
  PVector Rposition, Lposition;
  PVector Rmove, Lmove;
  int RHP, LHP;
  
  
  MultipleBullet(Fighter _fighter){
    super(_fighter);
    syurui = 5;
    Rposition = position.copy();
    Lposition = position.copy();
    Rmove = new PVector(15, -30);
    Lmove = new PVector(-15, -30);
    
    RHP = 1;
    LHP = 1;
  }
  
  void Draw()
  {
     super.Draw(); 
     
     ellipse(Rposition.x, Rposition.y, radius / 2, radius);
     Rposition.add(Rmove);
     
     ellipse(Lposition.x, Lposition.y, radius / 2, radius);
     Lposition.add(Lmove);
      
  }
}
