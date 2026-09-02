// Fake physics movement
// The ball only moves when something gives it velocity.

x += hspeed;
y += vspeed;

// Friction: gradually stop the ball
hspeed = lerp(hspeed, 0, ball_friction);
vspeed = lerp(vspeed, 0, ball_friction);

// Keep velocity under control
var ball_speed = point_distance(0, 0, hspeed, vspeed);
if (ball_speed > ball_max_speed)
{
    var ball_dir = point_direction(0, 0, hspeed, vspeed);
    hspeed = lengthdir_x(ball_max_speed, ball_dir);
    vspeed = lengthdir_y(ball_max_speed, ball_dir);
}

// Keep the ball from being pushed through the ground/walls.
if (place_meeting(x, y, Obj_Ground))
{
    // Undo the current movement if we entered the ground.
    x -= hspeed;
    y -= vspeed;

    // Kill the velocity component that points into the obstacle.
    if (place_meeting(x + hspeed, y, Obj_Ground)) hspeed = 0;
    if (place_meeting(x, y + vspeed, Obj_Ground)) vspeed = 0;
}
