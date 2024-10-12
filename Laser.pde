class Laser extends DisplayObject
{
   float p = width/2;
   
   Laser(Boss _boss){
     super();
     syurui = 8;
     HP = 10;
     R = 255;
     G = 0;
     B = 0;
     position.x = _boss.position.x;
     position.y = _boss.position.y + 120;
     move.x = _boss.move.x;
     move.y = 0;
   }
   
   void Draw()
   {
     super.Draw();
     
     if(position.x >= 654)
       move.x = -move.x;
     else if(position.x <= 246)
       move.x = -move.x;
     
     if (p != position.x)
     {
       print(position.x + "\n");
       p = position.x;
     }
     
     fill(R, G, B);
     
     HP++;
     if(HP >= 50)
     {
       HP = 50;
       ////strokeWeight(30);
       //strokeCap(ROUND);
       //line(position.x, position.y, position.x, height);
       //noStroke();
       move.y = 20;
       ellipse(position.x, position.y + 60, HP/4, HP/2);
     }
     else
       ellipse(position.x, position.y + 60, HP/2, HP/2);
     
     position.add(move);
   }
}
