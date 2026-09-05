// =====================================
// PLAYER MOVEMENT - PHYSICS WORLD
// =====================================

var vx = physics_get_linear_velocity_x(id);
var vy = physics_get_linear_velocity_y(id);

if (mouse_check_button(mb_left))
{
    target_x = mouse_x;
    target_y = mouse_y;
    moving = true;

    var target_dir = point_direction(x, y, target_x, target_y);
    var desired_x = lengthdir_x(max_speed, target_dir);
    var desired_y = lengthdir_y(max_speed, target_dir);

    // Smoothly accelerate toward the mouse direction.
    if (vx < desired_x)
        vx = min(vx + acceleration, desired_x);
    else
        vx = max(vx - acceleration, desired_x);

    if (vy < desired_y)
        vy = min(vy + acceleration, desired_y);
    else
        vy = max(vy - acceleration, desired_y);
}
else
{
    // Release the mouse = keep drifting, then slowly lose momentum.
    moving = false;

    if (vx > 0)
        vx = max(vx - deceleration, 0);
    else
        vx = min(vx + deceleration, 0);

    if (vy > 0)
        vy = max(vy - deceleration, 0);
    else
        vy = min(vy + deceleration, 0);
}

// Physics World handles collision resolution with the ground.
physics_set_linear_velocity(id, vx, vy);

move_speed = point_distance(0, 0, vx, vy);

// Stop tiny residual drift.
if (abs(vx) < 0.02 && abs(vy) < 0.02)
    physics_set_linear_velocity(id, 0, 0);

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
