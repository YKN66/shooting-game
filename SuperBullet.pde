class SuperBullet extends Bullet
{
   SuperBullet(Fighter _fighter){
     super(_fighter);
     radius = 12;
     HP = 10;
   }
   
   void Draw()
   {
      fill(R, G, B);
      ellipse(position.x, position.y, radius / 2, radius * 1.5);
      position.add(move);
   }
}
