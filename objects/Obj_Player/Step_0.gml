// =====================================
// PLAYER MOVEMENT - PHYSICS WORLD
// =====================================

var vx = phy_speed_x;
var vy = phy_speed_y;
var decel = 0.10;

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

    // Decelerate toward zero without using min/max with a negative value.
    if (abs(vx) <= decel)
        vx = 0;
    else
        vx -= sign(vx) * decel;

    if (abs(vy) <= decel)
        vy = 0;
    else
        vy -= sign(vy) * decel;
}

// Physics World handles collision resolution with the ground.
phy_speed_x = vx;
phy_speed_y = vy;

move_speed = point_distance(0, 0, vx, vy);

// Stop tiny residual drift.
if (abs(vx) < 0.02 && abs(vy) < 0.02)
{
    phy_speed_x = 0;
    phy_speed_y = 0;
}

// =====================================
// BALL ATTACHMENT
// =====================================

if (attached_ball == noone)
{
    var nearby_ball = instance_nearest(x, y, Obj_Ball);

    if (nearby_ball != noone && point_distance(x, y, nearby_ball.x, nearby_ball.y) <= 50)
        attached_ball = nearby_ball;
}

if (attached_ball != noone)
{
    if (!instance_exists(attached_ball))
    {
        attached_ball = noone;
    }
    else
    {
        var ball_dir = point_direction(x, y, attached_ball.x, attached_ball.y);
        var push_x = lengthdir_x(1, ball_dir);
        var push_y = lengthdir_y(1, ball_dir);
        var push_amount = vx * push_x + vy * push_y;

        // Moving away from the ball breaks the grab. Never pull the ball.
        if (push_amount <= 0)
        {
            attached_ball = noone;
        }
        else
        {
            // Only transfer outward force to the ball.
            attached_ball.phy_speed_x += push_x * push_amount * 0.08;
            attached_ball.phy_speed_y += push_y * push_amount * 0.08;
        }
    }
}

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
