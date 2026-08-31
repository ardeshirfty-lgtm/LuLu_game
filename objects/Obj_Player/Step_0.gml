if (mouse_check_button(mb_left))
{
    // تا وقتی موس نگه داشته شده، به سمت موس حرکت کن
    move_towards_point(mouse_x, mouse_y, move_speed);
}
else
{
    // وقتی موس ول شد، شارژ خالی شود
    move_speed = 0
}

// Step Event - Obj_Player
if moving = true {
    
    


   move_towards_point(target_x , target_y, move_speed);
    
//if  vspeed !=0 hspeed!= 0 xprevious > x  {vspeed+= 2  hspeed+=2}
    move_speed = max( move_speed - friction , 0)
   
    
    // اگر مستقیم جلو آزاد نیست
    if (place_meeting( x + hspeed, y, Obj_Ground))
    {
        hspeed = 0;
    }
    
    if (place_meeting(x, y + vspeed, Obj_Ground))
    {
        vspeed = 0;
    }
    
    // رسیدن به مقصد
    if (point_distance(x, y, target_x, target_y) < 5)
    {
        moving = false;
        speed = 0;
    }
}


if burning = false {

     if mouse_x < x  {image_xscale = -1; }
     if mouse_x > x  {image_xscale = 1;  }
}

if (invincible)
{
    invincible_time -= 1;

    if (invincible_time <= 0)
    {
        invincible = false;
        invincible_time = 0;
    }
}







if keyboard_check(vk_nokey) {friction = 0.2; moving = false;}

 





 // eating Animation================================= ---


if (sprite_index == Player_eating) 
    if (image_index >= image_number - 1) {
        sprite_index = SP_Player ; // اسم واقعی اسپرایت idle
        image_index = 0;
    }



/// burning Animation===================================


// انیمیشن سوختن
if (net_trapped)
{
    net_timer--;

    if (net_timer <= 0)
    {
        net_trapped = false;
        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;
    }
}


