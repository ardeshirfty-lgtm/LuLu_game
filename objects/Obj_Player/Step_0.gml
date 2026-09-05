
if (mouse_check_button(mb_left))
{
    move_towards_point(mouse_x, mouse_y, move_speed);
}
else
{
    move_speed = 0;
}

// Step Event - Obj_Player

{
    move_towards_point(mouse_x, mouse_y, move_speed);

    move_speed = max(move_speed - friction, 0);

    if (place_meeting(x + hspeed, y, Obj_Ground))
    {
        hspeed = 0;
    }

    if (place_meeting(x, y + vspeed, Obj_Ground))
    {
        vspeed = 0;
    }

    if (point_distance(x, y, mouse_x, mouse_y) < 5)
    {
        moving = false;
        speed = 0;
    }
}



     if mouse_x < x  {image_xscale = -1; }
     if mouse_x > x  {image_xscale = 1;  }

/*
if (invincible)
{
    invincible_time -= 1;

    if (invincible_time <= 0)
    {
        invincible = false;
        invincible_time = 0;
    }
}







//if keyboard_check(vk_nokey) {friction = 0.2; moving = false;}

 





 // eating Animation================================= ---


if (sprite_index == Player_eating) 
    if (image_index >= image_number - 1) {
        sprite_index = SP_Player ; // اسم واقعی اسپرایت idle
        image_index = 0;
    }


if (sprite_index == Sp_burning)
{
    if (invincible == false)
    {
        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;
    }
}


// Net Trap
if (net_trapped)
{
    net_timer--;

    if (net_timer <= 0)
    {
        // آزاد شدن از تور
        net_trapped = false;

        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;

        // یک ثانیه تور دوباره روی Player اثر نگذارد
        net_cooldown = room_speed * 1;
    }
}
