// =====================================
// BALL MOVEMENT
// =====================================

// Apply the push collected by Obj_Player collision.
hspeed += pending_push_x;
vspeed += pending_push_y;
pending_push_x = 0;
pending_push_y = 0;

// Simple, stable gravity.
vspeed += ball_gravity;

// Limit velocity.
var ball_speed = point_distance(0, 0, hspeed, vspeed);
if (ball_speed > ball_max_speed)
{
    var ball_dir = point_direction(0, 0, hspeed, vspeed);
    hspeed = lengthdir_x(ball_max_speed, ball_dir);
    vspeed = lengthdir_y(ball_max_speed, ball_dir);
}

// Horizontal movement + wall collision.
var old_x = x;
x += hspeed;

if (place_meeting(x, y, Obj_Ground))
{
    x = old_x;
    hspeed = -hspeed * ball_bounce;
}

// Vertical movement + floor/ceiling collision.
var old_y = y;
y += vspeed;

if (place_meeting(x, y, Obj_Ground))
{
    y = old_y;
    vspeed = -vspeed * ball_bounce;

    // Stop tiny bounces instead of jittering forever.
    if (abs(vspeed) < 0.35)
        vspeed = 0;
}

// =====================================
// ENEMY DAMAGE
// =====================================

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
{
    damage = true;
}

if (damage == true)
{
    health -= 5;
    damage = false;
    invincible = true;
    invincible_time = 30;
}

if (invincible == true)
{
    invincible_time--;

    if (invincible_time <= 0)
    {
        invincible_time = 0;
        invincible = false;
    }
}
