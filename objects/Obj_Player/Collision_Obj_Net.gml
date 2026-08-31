/*
var dir = point_direction(x, y, other.x, other.y);

x += lengthdir_x(20, dir);
y += lengthdir_y(20, dir);



if (!invincible)
{
    health -= 1;
    
    // 2 ثانیه ضدضربه
    invincible = true;
    invincible_time = room_speed * 2;
    
}
*/


/*
 if (!burning)
{
    burning = true;
    sprite_index = Sp_burning;
    image_index = 0;
    image_speed = 0.2;
}
 * /*/
timer +=1
if (!net_trapped)
{
    net_trapped = true;
    net_timer = room_speed * 1;

    moving = false;
    sprite_index = Sp_burning;
    image_index = 0;
    image_speed = 1;
    x = other.x
}
else {
	 if timer = 30 { motion_add(45 , 5 )  }
}
