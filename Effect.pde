class Effect extends DisplayObject
{
  int red_radius, orange_radius;
  int expantion;
  
  Effect(PVector center){
    super();
    syurui = -1;
    position.x = center.x;
    position.y = center.y;
    R = 255;
    G = 165;
    B = 0;
    red_radius = 15;
    orange_radius = 30;
    expantion = 3;
    
    HP = 20;
  }

  void Draw()
  {
    super.Draw();
    HP--;

    fill(R, G, B);
    ellipse(position.x, position.y, orange_radius, orange_radius);
    fill(R, 0, B);
    ellipse(position.x, position.y, red_radius, red_radius);
    
    red_radius += expantion;
    orange_radius += expantion;
    if(orange_radius >= 60)
    {
      red_radius = 15;
      orange_radius = 30;
    }
    
  }
}
