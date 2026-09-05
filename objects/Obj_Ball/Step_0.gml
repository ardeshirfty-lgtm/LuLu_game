// =====================================
// BALL MOVEMENT
// =====================================

// Apply the push collected by Obj_Player collision.
hspeed += pending_push_x;
vspeed += pending_push_y;
pending_push_x = 0;
pending_push_y = 0;

// Simple gravity.
vspeed += ball_gravity;

// Limit velocity.
var ball_speed = point_distance(0, 0, hspeed, vspeed);
if (ball_speed > ball_max_speed)
{
    var ball_dir = point_direction(0, 0, hspeed, vspeed);
    hspeed = lengthdir_x(ball_max_speed, ball_dir);
    vspeed = lengthdir_y(ball_max_speed, ball_dir);
}

// =====================================
// HORIZONTAL COLLISION
// Move in small steps so the ball cannot tunnel into a wall.
// =====================================

var move_x = hspeed;
var steps_x = max(1, ceil(abs(move_x)));
var step_x = move_x / steps_x;
var hit_x = false;

for (var i = 0; i < steps_x; i++)
{
    x += step_x;

    if (place_meeting(x, y, Obj_Ground))
    {
        x -= step_x;
        hit_x = true;
        break;
    }
}

if (hit_x)
    hspeed = -hspeed * ball_bounce;

// =====================================
// VERTICAL COLLISION
// =====================================

var move_y = vspeed;
var steps_y = max(1, ceil(abs(move_y)));
var step_y = move_y / steps_y;
var hit_y = false;

for (var j = 0; j < steps_y; j++)
{
    y += step_y;

    if (place_meeting(x, y, Obj_Ground))
    {
        y -= step_y;
        hit_y = true;
        break;
    }
}

if (hit_y)
{
    vspeed = -vspeed * ball_bounce;

    if (abs(vspeed) < 0.35)
        vspeed = 0;
}

// =====================================
// ENEMY DAMAGE
// =====================================

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
    damage = true;

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
