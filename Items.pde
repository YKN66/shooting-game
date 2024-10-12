class Items extends DisplayObject
{
  float star;
  float sword;
  float n;
  PVector baseVertex;
  int itemID;
  int heart;

  Items(PVector center) {
    super();
    syurui = 4;
    position.x = center.x;
    position.y = center.y;
    R = 255;
    G = 255;
    B = 0;
    HP = 200;
    move.x = 0;
    move.y = 2;
    baseVertex = new PVector(0,0);
    
    star = 21;
    heart = 1;
    sword = 15;
    n = sword /3;
    
    itemID = (int)random(5);
  }

  void Draw()
  {
    super.Draw();
    
    //star
    if(itemID == 0 || itemID == 3)
    {
      fill(R, G, B);
      int b;
      int a[] = {1,4,2,5,3};
      
      beginShape();
      for (int i = 0; i < 5; i++)
      {
        b = a[i] - 1;
        float x = star * cos(2 * PI * b / 5 + PI / 2) + position.x;
        float y = star * sin(2 * PI * b / 5 - PI / 2) + position.y;
        vertex(x, y);
      
        if(y > baseVertex.y)
        {
           baseVertex.x = x;
           baseVertex.y = y;
        }
      }
      endShape();
    }
    //heart
    else if(itemID == 1)
    {
      fill(R, 0, 0);
      beginShape();
      for (int theta = 0; theta < 360; theta++)
      {
        float x = heart * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta))) + position.x;
        float y = (-1) * heart * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta))) + position.y;
        vertex(x, y);
        
        if(y > baseVertex.y)
        {
           baseVertex.x = x;
           baseVertex.y = y;
        }
        
      }
      endShape();
    }
    //sword
    else if(itemID == 2 && !haveSword)
    {
      
      stroke(255);
      strokeWeight(1);
      line(position.x, position.y, position.x + sword, position.y - sword);
      line(position.x + sword, position.y - sword, position.x + sword + n, position.y - sword);
      line(position.x + sword + n, position.y - sword, position.x + sword + n, position.y - sword + n);
      line(position.x + sword + n, position.y - sword + n, position.x + n, position.y + n);
      
      stroke(255,255,0);
      strokeWeight(4);
      line(position.x - n, position.y - n, position.x + 2*n, position.y + 2*n);
      
      strokeWeight(6);
      line(position.x + n/2, position.y + n/2, position.x + n/2 - n, position.y + n/2 + n);
      noStroke();
      
      baseVertex.x = position.x + 2*n;
      baseVertex.y = position.y + 2*n;
      
    }
    
    position.add(move);
    
  }
}
