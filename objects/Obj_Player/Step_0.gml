// =====================================
// PLAYER MOVEMENT - FLOATY / JETPACK
// =====================================

if (mouse_check_button(mb_left))
{
    target_x = mouse_x;
    target_y = mouse_y;
    moving = true;

    var target_dir = point_direction(x, y, target_x, target_y);
    var desired_x = lengthdir_x(max_speed, target_dir);
    var desired_y = lengthdir_y(max_speed, target_dir);

    // Accelerate toward the mouse direction.
    if (hspeed < desired_x)
        hspeed = min(hspeed + acceleration, desired_x);
    else
        hspeed = max(hspeed - acceleration, desired_x);

    if (vspeed < desired_y)
        vspeed = min(vspeed + acceleration, desired_y);
    else
        vspeed = max(vspeed - acceleration, desired_y);
}
else
{
    // Release the mouse = keep drifting, then slowly lose momentum.
    moving = false;

    if (hspeed > 0)
        hspeed = max(hspeed - deceleration, 0);
    else
        hspeed = min(hspeed + deceleration, 0);

    if (vspeed > 0)
        vspeed = max(vspeed - deceleration, 0);
    else
        vspeed = min(vspeed + deceleration, 0);
}

move_speed = point_distance(0, 0, hspeed, vspeed);

// Move horizontally. If we hit a surface, remove only the blocked axis.
var old_x = x;
x += hspeed;

if (place_meeting(x, y, Obj_Ground))
{
    x = old_x;
    hspeed = 0;
}

// Move vertically. This lets the player slide along walls/floors.
var old_y = y;
y += vspeed;

if (place_meeting(x, y, Obj_Ground))
{
    y = old_y;
    vspeed = 0;
}

// Stop tiny residual drift.
if (abs(hspeed) < 0.02) hspeed = 0;
if (abs(vspeed) < 0.02) vspeed = 0;

move_speed = point_distance(0, 0, hspeed, vspeed);

// Face the mouse.
if (mouse_x < x)
    image_xscale = -1;
else if (mouse_x > x)
    image_xscale = 1;

// =====================================
// ANIMATION / NET LOGIC
// =====================================

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
