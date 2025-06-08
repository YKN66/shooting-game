// Yuki KOBAYASHI

//    宇宙大戦争の遊び方
//
//    増殖するUFOを倒して地球を救おう
//    弾丸はスペースキーを押すと発射されるよ
//    UFOがドロップするアイテムをゲットしてパワーアップしよう！
//    しばらくすると、敵のボスがが出てくるよ
//    ボスを倒してゲームをクリアしよう
//    一定確率で心強い味方も現れるよ
//



import ddf.minim.*;
Minim minim;
AudioSample bullet_sound, damage_sound, explosion_sound, sword_sound, superbullet_sound, heart_sound, bossEmerge_sound, bgm_sound, bossbgm_sound, laser_sound;

ArrayList<DisplayObject>objects = new ArrayList<DisplayObject>();
Fighter fighter;
Boss boss;
boolean gameover = false;
boolean gameclear = false;
boolean bossEmerge = false;
int Plevel = 1;
boolean haveStar = false;
boolean haveSword = false;
boolean haveBuddy = false;
int itemframeCount = 0;
int score = 0;
PVector[] planet = new PVector[120];


// syurui
// -1 Effect
//  0 Fighter
//  1 Fighter's Bullet
//  2 Enemy
//  3 Enemy's Bullet
//  4 Item
//  5 Triple Bullet(RL)
//  6 Buddy
//  7 Boss
//  8 Laser


void GameStart()
{
  objects = new ArrayList<DisplayObject>();
  size(900, 900);
  score = 0;
  gameover = false;
  gameclear = false;
  Plevel = 1;
  haveStar = false;
  haveSword = false;
  haveBuddy = false;
  itemframeCount = 0;
  frameCount = 0;

  fighter = new Fighter();
  objects.add(fighter);
  boss = new Boss();

  minim = new Minim(this);
  bullet_sound = minim.loadSample("Bullet.mp3");
  explosion_sound = minim.loadSample("Explosion.mp3");
  damage_sound = minim.loadSample("Damage.mp3");
  sword_sound = minim.loadSample("sword.mp3");
  superbullet_sound = minim.loadSample("superbullet.mp3");
  heart_sound = minim.loadSample("heart.mp3");
  bossEmerge_sound = minim.loadSample("bossEmerge.mp3");
  bgm_sound = minim.loadSample("bgm.mp3");
  bossbgm_sound = minim.loadSample("bossbgm.mp3");
  laser_sound = minim.loadSample("laser.mp3");
  
  bgm_sound.trigger();
}

void setup()
{
  pixelDensity(2);
  size(900, 900);

  fighter = new Fighter();
  objects.add(fighter);
  boss = new Boss();

  for (int i = 0; i < 120; i++)
  {
    if(i < 110)
      planet[i] = new PVector(random(10, width), random(30, height));
    else if( i > 111)
      planet[i] = new PVector(random(10, width), random(270, height));
    else if( i == 110)
      planet[i] = new PVector(90, 180);
    else if (i == 111)
      planet[i] = new PVector(width - 90, 180);
  }

  minim = new Minim(this);
  bullet_sound = minim.loadSample("Bullet.mp3");
  explosion_sound = minim.loadSample("Explosion.mp3");
  damage_sound = minim.loadSample("Damage.mp3");
  sword_sound = minim.loadSample("sword.mp3");
  superbullet_sound = minim.loadSample("superbullet.mp3");
  heart_sound = minim.loadSample("heart.mp3");
  bossEmerge_sound = minim.loadSample("bossEmerge.mp3");
  bgm_sound = minim.loadSample("bgm.mp3");
  bossbgm_sound = minim.loadSample("bossbgm.mp3");
  laser_sound = minim.loadSample("laser.mp3");
  
  bgm_sound.trigger();
}

void draw()
{
  background(0, 0, 66);
  int random = (int)random(1,6);
  
  for (int i = 0; i < 120; i++)
  {
    beginShape();
    if (i <= 80)
    {
      fill(100, 150, 195, 128);
      ellipse(planet[i].x, planet[i].y, random, random);
    }
    else if (i > 80 && i < 110)
    {
      fill(255, 255, 0, 180);
      int b;
      int a[] = {1, 4, 2, 5, 3};
      for (int j = 0; j < 5; j++)
      {
        b = a[j] - 1;
        float x = random * cos(2 * PI * b / 5 + PI / 2) + planet[i].x;
        float y = random * sin(2 * PI * b / 5 - PI / 2) + planet[i].y;
        vertex(x, y);
      }
    }
    else if(i == 110)
    {
      fill(60, 120, 120);
      ellipse(planet[i].x, planet[i].y, 21, 21);
      stroke(255, 255, 0, 150);
      push();
      translate(planet[i].x, planet[i].y);
      rotate(radians(45));
      ellipse(0, 0, 10, 40);
      pop();
      noStroke();
      
    }
    else if( i == 111)
    {
      fill(255, 192, 203);
      ellipse(planet[i].x, planet[i].y, 21, 21);
      stroke(255, 255, 0, 150);
      push();
      translate(planet[i].x, planet[i].y);
      rotate(radians(-30));
      ellipse(0, 0, 10, 40);
      pop();
      noStroke();
    }
    else if(i == 112)
    {
      fill(231, 222, 222);
      ellipse(planet[i].x, planet[i].y, 21, 21);
      stroke(255, 255, 0, 150);
      push();
      translate(planet[i].x, planet[i].y);
      rotate(radians(78));
      ellipse(0, 0, 10, 40);
      pop();
      noStroke();
    }
    else if(i == 113)
    {
      fill(255, 153, 0);
      ellipse(planet[i].x, planet[i].y, 21, 21);
      fill(244, 192, 123);
      ellipse(planet[i].x + random, planet[i].y + random, random, 5);
    }
    else if( i== 114)
    {
      fill(85, 204, 225);
      ellipse(planet[i].x, planet[i].y, 21, 21);
      fill(42, 204, 18);
      ellipse(planet[i].x + random, planet[i].y, 9, 9);
    }
    endShape();
  }

  fill(204);
  rect(0, 0, width, 30);
  noFill();

  if (!gameover && !gameclear)
  {
    fill(0, 0, 0, 100);
    rect(0, 0, width, height);
    if (frameCount < 120)
    {
      fill(255, 255, 255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("S T A R  W A R S", width/2, height/2);
      return;
    }
    textAlign(TOP, LEFT);
    
    // buddy emerge 
    if(random(255) < 64 && !haveBuddy)
    {
      objects.add(new Buddy());
      haveBuddy = true;
    }
      
    // enemy Power Level
    if (frameCount % 100 == 0)
      Plevel++;
      
    // Boss emerge
    if(frameCount == 1000)
    {
      objects.add(boss);
      bossEmerge_sound.trigger();
      bossEmerge = true;
      bgm_sound.stop();
      
    }
    else
    {
      Enemy enemy = new Enemy();
      float randomE = random(500);
      if (randomE < Plevel*2)                  
        objects.add(enemy);
      if (randomE < Plevel*4)
        objects.add(new Bullet(fighter, enemy)); 
    }

    for (int i = 0; i < objects.size(); i++)
    {
      objects.get(i).Draw();
      //self bullet(center + RL)
      if ((objects.get(i).syurui == 1 || objects.get(i).syurui == 5) && objects.get(i).position.y < 30)
        objects.remove(i);
      //enemy bullet
      else if (objects.get(i).syurui == 3 && 
              (objects.get(i).position.x < 0 || objects.get(i).position.x > width || objects.get(i).position.y < 30 || objects.get(i).position.y > height))
        objects.remove(i);
      //enemy or item
      else if ((objects.get(i).syurui == 2 || objects.get(i).syurui == 4 || objects.get(i).syurui == 8) && objects.get(i).position.y > height)
        objects.remove(i);
    }

    //star item
    if (frameCount - itemframeCount >= 300)
      haveStar = false;

    Collision();
    
  }
  else if(gameover)
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("G a m e  O v e r !", width/2, height/2);
    textAlign(TOP, LEFT);
    bossEmerge = false;
    
  }
  else if (gameclear)
  {
    for(int i = 0; i < objects.size(); i++)
      objects.get(i).HP = 0;
    fill(255, 255, 0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("G A M E  C L E A R !", width/2, height/2);
    textAlign(TOP, LEFT);
    bossbgm_sound.stop();
  }
}

void keyPressed()
{
  switch(keyCode)
  {
  case RIGHT:
    fighter.moveDirection = 1;
    break;
  case LEFT:
    fighter.moveDirection = -1;
    break;
  case ENTER:
    gameover = false;
    gameclear = false;
    GameStart();
    break;
  default:
    fighter.moveDirection = 0;
    break;
  }
  if (key == ' ')
  {
    if (haveSword)
    {
      objects.add(new MultipleBullet(fighter));
    }
    if (haveStar)
    {
      objects.add(new SuperBullet(fighter));
      superbullet_sound.trigger();
    } else
    {
      objects.add(new Bullet(fighter));
      bullet_sound.trigger();
    }
  }
}

void keyReleased()
{
  fighter.moveDirection = 0;
}

void Collision()
{
  for (int i = 0; i < objects.size(); i++)
  {
    for (int j = 0; j < objects.size(); j++)
    {

      //enemy
      if (objects.get(i).syurui == 2)
      {
        Enemy enemy = (Enemy)objects.get(i);

        //enemy and fighter bullet collision process
        if (objects.get(j).syurui == 1)
        {
          Bullet bullet = (Bullet)objects.get(j);
          if (bullet.position.x >= enemy.position.x - enemy.size_y / 2 && bullet.position.x <= enemy.position.x + enemy.size_x + enemy.size_y / 2)
            if (bullet.position.y >= enemy.position.y - enemy.size_x / 2 && bullet.position.y <= enemy.position.y + enemy.size_y + enemy.size_y / 2)
            {
              enemy.HP -= bullet.HP;
              bullet.HP--;
              damage_sound.trigger();
            }
        }


        //enemy and fighter collision process
        else if (objects.get(j).syurui == 0)
        {
          Fighter fighter = (Fighter)objects.get(j);
          //PVector enemy_center = new PVector(enemy.position.x + enemy.size_x / 2, enemy.position.y + enemy.size_y / 2);
          //PVector fighter_center = new PVector(fighter.position.x + fighter.size_x / 2, fighter.position.y + fighter.size_y / 2);

          PVector center_distance = new PVector(abs((enemy.position.x + enemy.size_x / 2) - (fighter.position.x + fighter.size_x / 2)), 
                                                abs((enemy.position.y + enemy.size_y / 2) - (fighter.position.y + fighter.size_y / 2)));

          if (center_distance.x <= (enemy.size_x + fighter.size_x) / 2)
            if (center_distance.y <= (enemy.size_y + fighter.size_y) / 2)
            {
              fighter.HP -= enemy.HP;
              enemy.HP = 0;
              damage_sound.trigger();
            }
        }

        //enemy and RLbullet
        else if (objects.get(j).syurui == 5)
        {
          MultipleBullet bullet = (MultipleBullet)objects.get(j);
          if (bullet.Rposition.x >= enemy.position.x - enemy.size_y / 2 && bullet.Rposition.x <= enemy.position.x + enemy.size_x + enemy.size_y / 2)
            if (bullet.Rposition.y >= enemy.position.y && bullet.Rposition.y <= enemy.position.y + enemy.size_y + enemy.size_y / 2)
            {
              enemy.HP -= bullet.RHP;
              bullet.RHP--;
              damage_sound.trigger();
            }

          if (bullet.Lposition.x >= enemy.position.x - enemy.size_y / 2 && bullet.Lposition.x <= enemy.position.x + enemy.size_x + enemy.size_y / 2)
            if (bullet.Lposition.y >= enemy.position.y && bullet.Lposition.y <= enemy.position.y + enemy.size_y + enemy.size_y / 2)
            {
              enemy.HP -= bullet.LHP;
              bullet.LHP--;
              damage_sound.trigger();
            }
        }
        
        //enemy and enemy
        else if(objects.get(j).syurui == 2)
        {
          Enemy enemy2 = (Enemy)objects.get(j);
          PVector center_distance = new PVector(abs((enemy.position.x + enemy.size_x / 2) - (enemy2.position.x + enemy2.size_x / 2)),
                                                abs((enemy.position.y + enemy.size_x / 2) - (enemy2.position.y + enemy2.size_x / 2)));
          
          if (center_distance.x <= (enemy.size_x + enemy2.size_x) / 2)
            if (center_distance.y <= (enemy.size_y + enemy2.size_y) / 2)
            {
              enemy.move.x = -enemy.move.x;
              enemy.move.y = -enemy.move.y;
              enemy2.move.x = -enemy2.move.x;
              enemy2.move.y = -enemy2.move.y;
            }
        }
        
      }


      //fighter
      else if (objects.get(i).syurui == 0)
      {
        Fighter fighter = (Fighter)objects.get(i);


        //fighter and enemy bullet collision process
        if (objects.get(j).syurui == 3)
        {
          Bullet bullet = (Bullet)objects.get(j);
          if (bullet.position.x >= fighter.position.x && bullet.position.x <= fighter.position.x + fighter.size_x)
            if (bullet.position.y >= fighter.position.y && bullet.position.y <= fighter.position.y + fighter.size_y)
            {
              fighter.HP -= bullet.HP;
              bullet.HP--;
              damage_sound.trigger();
            }
        }


        //fighter and Items collosion process
        else if (objects.get(j).syurui == 4)
        {
          Items item = (Items)objects.get(j);
          if ((item.baseVertex.y >= fighter.position.y) && (item.position.x >= fighter.position.x) 
            && (item.position.x <= fighter.position.x + fighter.size_x))
          {
            item.HP = 0;

            if (item.itemID == 0 || item.itemID == 3)
            {
              haveStar = true;
            }
            else if (item.itemID == 1)
            {
              fighter.HP += 20;
              heart_sound.trigger();
            }
            else if ( item.itemID == 2)
            {
              haveSword = true;
              sword_sound.trigger();
            }

            itemframeCount = frameCount;
          }
        }
        
        //fighter and Boss
        else if(objects.get(j).syurui == 7)
        {
          Boss boss = (Boss)objects.get(j);
          if((fighter.position.x >= boss.position.x - boss.size_x * 1.1 / 2) && (fighter.position.x <= boss.position.x + boss.size_x * 1.1 / 2))
            if(fighter.position.y <= boss.position.y + 120)
            {
              fighter.HP = 0;
            }
        }
        
        //fighter and Boss Laser
        else if(objects.get(j).syurui == 8)
        {
           Laser laser = (Laser)objects.get(j);
           float center_distance = (abs((laser.position.x) - (fighter.position.x + fighter.size_x / 2)));
           if(center_distance <= (fighter.size_x + laser.HP) / 3)
             if(laser.position.y >= fighter.position.y && laser.position.y <= fighter.position.y + fighter.size_y)
             {
               fighter.HP -= laser.HP;
               laser.HP = 0;
             }
        }
      }
      
      //Boss
      else if( objects.get(i).syurui == 7)
      {
        Boss boss = (Boss)objects.get(i);
        
        //Boss and bullet
        if(objects.get(j).syurui == 1)
        {
          Bullet bullet = (Bullet)objects.get(j);
          
          if((bullet.position.x >= boss.position.x - boss.size_x * 1.1 / 2) && (bullet.position.x <= boss.position.x + boss.size_x * 1.1 / 2))
            if(bullet.position.y <= boss.position.y + 60)
            {
              boss.HP -= bullet.HP;
              bullet.HP--;
              objects.add(new Effect(bullet.position));
            }
        }
        
        //boss and triplebullet
        if(objects.get(j).syurui == 5)
        {
          MultipleBullet bullet = (MultipleBullet)objects.get(j);
          
          if((bullet.Rposition.x >= boss.position.x - boss.size_x * 1.1 / 2) && (bullet.Rposition.x <= boss.position.x + boss.size_x * 1.1 / 2))
            if(bullet.Rposition.y <= boss.position.y + 60)
            {
              boss.HP -= bullet.RHP;
              bullet.RHP--;
              damage_sound.trigger();
            }

          if((bullet.Lposition.x >= boss.position.x - boss.size_x * 1.1 / 2) && (bullet.Lposition.x <= boss.position.x + boss.size_x * 1.1 / 2))
            if(bullet.Lposition.y <= boss.position.y + 60)
            {
              boss.HP -= bullet.LHP;
              bullet.LHP--;
              damage_sound.trigger();
            }
        }
      }
      
      //Buddy
      else if(objects.get(i).syurui == 6)
      {
        Buddy buddy = (Buddy)objects.get(i);
        
        //buddy and enemy bullet
        if(objects.get(j).syurui == 3)
        {
          Bullet bullet = (Bullet)objects.get(j);
          if (bullet.position.x >= buddy.position.x && bullet.position.x <= buddy.position.x + buddy.size_x)
            if (bullet.position.y >= buddy.position.y && bullet.position.y <= buddy.position.y + buddy.size_y)
            {
              buddy.HP -= bullet.HP;
              bullet.HP--;
            }
        }
        
        //buddy and boss laser
        else if(objects.get(j).syurui == 8)
        {
           Laser laser = (Laser)objects.get(j);
           float center_distance = (abs((laser.position.x) - (buddy.position.x + buddy.size_x / 2)));
           if(center_distance <= (buddy.size_x + laser.HP) / 3)
           {
             buddy.HP -= laser.HP;
             laser.HP /= 3;
           }
        }
      }

      //super bullet and Enemy bullet
      if (objects.get(i).syurui == 3)
      {
        Bullet enemybullet = (Bullet)objects.get(i);
        if (objects.get(j).syurui == 1)
        {
          Bullet superbullet = (Bullet)objects.get(j);
          if (enemybullet.position.x >= superbullet.position.x - superbullet.radius && enemybullet.position.x <= superbullet.position.x + superbullet.radius)
            if (enemybullet.position.y >= superbullet.position.y - superbullet.radius && enemybullet.position.y <= superbullet.position.y + superbullet.radius)
              if (haveStar)
              {
                enemybullet.HP--;
                objects.get(j).HP--;
              }
        }
      }
    }

    //delete process
    if (objects.get(i).HP <= 0)
    {
      if (objects.get(i).syurui == 2)
      {
        defeat((Enemy)objects.get(i), i);
        explosion_sound.trigger();
      }
      else if (objects.get(i).syurui == 0)
        gameover = true;
      else if(objects.get(i).syurui == 7)
      {
        gameclear = true;
        bossEmerge = false;
      }
      else if(objects.get(i).syurui == 6)
      {
        haveBuddy = false;
        objects.remove(i);
      }
      else
        objects.remove(i);
    }
    if (objects.size() <= i)
      break;
  }
}

void defeat(Enemy enemy, int i)
{
  PVector center = new PVector(enemy.position.x + enemy.size_x/2, enemy.position.y + enemy.size_y/2);
  //println(center.x);

  objects.remove(i);
  objects.add(new Effect(center));
  score++;

  if (!bossEmerge)
  {
    if(!haveStar)
      if (random(100) < 25)
        objects.add(new Items(center));
  }
  else
  {
    if(random(2) < 1)
      objects.add(new Items(center));
  }
}
