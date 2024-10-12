class Boss extends Enemy
{
   Boss(){
     super();
     syurui = 7;
     HP = 10000;
     position.x = width/2;
     position.y = 30;
     move.x = 1;
     move.y = 0;
     size_x = width * 0.5;
     R = 240;
     G = 240;
     B = 192;
     
   }
   
   void Draw()
   {
     
     if((position.x + size_x * 1.1 / 2) >= width)
     {
       move.x = -move.x;
       println(position.x);
     }
     else if((position.x - size_x * 1.1 / 2) <= 0)
     {
       move.x = -move.x;
       println(position.x);
     }
     
     
     // arc ( center.x , center.y, width, height, from, to);
     fill(204);
     arc(position.x, position.y, size_x * 1.1, 120, radians(0), radians(180));
     stroke(153);
     arc(position.x, position.y + 120 + (size_x * 1.73205080757 / 6), 2 * ((size_x / 3) + 60 * 1.41421356237), 2 * ((size_x / 3) + 60 * 1.41421356237), radians(240), radians(300));
     
     stroke(0, 0, 40);
     fill(0, 0, 40);
     triangle(position.x, position.y + 120 + (size_x * 1.73205080757 / 6), position.x  - size_x / 6, position.y + 120, position.x + size_x / 6, position.y + 120);
     
     fill(R, G, B);
     arc(position.x, position.y + 120, size_x / 3, size_x / 12, -PI, TWO_PI);
     strokeWeight(4);
     stroke(255);
     
     noStroke();
     noFill();
     
     position.add(move);
     
     objects.add(new Laser(this));
     laser_sound.trigger();
   }
}
