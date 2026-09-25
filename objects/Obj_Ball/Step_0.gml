// =====================================
// BALL - NO PHYSICS WORLD
// =====================================

// Slow down gradually.
var ball_decel = 0.05;

if (abs(ball_vx) <= ball_decel)
    ball_vx = 0;
else
    ball_vx -= sign(ball_vx) * ball_decel;

if (abs(ball_vy) <= ball_decel)
    ball_vy = 0;
else
    ball_vy -= sign(ball_vy) * ball_decel;

// Limit speed.
var ball_speed = point_distance(0, 0, ball_vx, ball_vy);

if (ball_speed > ball_max_speed)
{
    var ball_dir = point_direction(0, 0, ball_vx, ball_vy);
    ball_vx = lengthdir_x(ball_max_speed, ball_dir);
    ball_vy = lengthdir_y(ball_max_speed, ball_dir);
}

// =====================================
// MANUAL GROUND COLLISION / BOUNCE
// =====================================

if (!place_meeting(x + ball_vx, y, Obj_Ground))
{
    x += ball_vx;
}
else
{
    ball_vx = -ball_vx * 0.5;

    if (!place_meeting(x + ball_vx, y, Obj_Ground))
        x += ball_vx;
    else
        ball_vx = 0;
}

if (!place_meeting(x, y + ball_vy, Obj_Ground))
{
    y += ball_vy;
}
else
{
    ball_vy = -ball_vy * 0.5;

    if (!place_meeting(x, y + ball_vy, Obj_Ground))
        y += ball_vy;
    else
        ball_vy = 0;
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
