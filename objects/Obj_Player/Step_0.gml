// =====================================
// PLAYER MOVEMENT
// =====================================

if (mouse_check_button(mb_left))
{
    target_x = mouse_x;
    target_y = mouse_y;
    moving = true;
    move_speed = min(move_speed + acceleration, max_speed);
}
else
{
    move_speed = max(move_speed - deceleration, 0);

    if (move_speed <= 0)
        moving = false;
}

if (moving && point_distance(x, y, target_x, target_y) > 2)
{
    var move_dir = point_direction(x, y, target_x, target_y);

    hspeed = lengthdir_x(move_speed, move_dir);
    vspeed = lengthdir_y(move_speed, move_dir);

    // Move horizontally and stop cleanly at the ground/walls.
    var old_x = x;
    x += hspeed;

    if (place_meeting(x, y, Obj_Ground))
    {
        x = old_x;
        hspeed = 0;
    }

    // Move vertically and stop cleanly at the ground/walls.
    var old_y = y;
    y += vspeed;

    if (place_meeting(x, y, Obj_Ground))
    {
        y = old_y;
        vspeed = 0;
    }
}
else
{
    hspeed = 0;
    vspeed = 0;

    if (point_distance(x, y, target_x, target_y) <= 2)
        moving = false;
}

// Face the mouse.
if (mouse_x < x)
    image_xscale = -1;
else if (mouse_x > x)
    image_xscale = 1;

// Keep the health / animation / net logic below this point.

if (sprite_index == Player_eating)
{
    if (image_index >= image_number - 1)
    {
        sprite_index = SP_Player;
        image_index = 0;
    }
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

if (net_trapped)
{
    net_timer--;

    if (net_timer <= 0)
    {
        net_trapped = false;
        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;
        net_cooldown = room_speed;
    }
}
