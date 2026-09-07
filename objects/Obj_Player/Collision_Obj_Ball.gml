// Stick to the Ball while the player keeps pushing in roughly the same direction.
// A strong change of mouse direction breaks the attachment.

var player_vx = physics_get_linear_velocity_x(id);
var player_vy = physics_get_linear_velocity_y(id);

if (attached_ball == noone)
{
    var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
    var player_dir = point_direction(0, 0, player_vx, player_vy);
    var speed = point_distance(0, 0, player_vx, player_vy);

    // Only stick when we are actually pushing and the mouse direction
    // agrees with the current movement direction.
    if (mouse_check_button(mb_left) && speed > 0.05)
    {
        var dir_difference = abs(angle_difference(mouse_dir, player_dir));

        if (dir_difference <= ball_stick_angle)
            attached_ball = other.id;
    }
}

if (attached_ball == other.id)
{
    // Keep the Ball moving with the Player while the push direction agrees.
    var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
    var player_dir = point_direction(0, 0, player_vx, player_vy);
    var dir_difference = abs(angle_difference(mouse_dir, player_dir));

    // Clicking/aiming strongly in another direction releases the Ball.
    if (!mouse_check_button(mb_left) || dir_difference > ball_stick_angle)
    {
        attached_ball = noone;
    }
    else
    {
        physics_set_linear_velocity(other.id, player_vx, player_vy);
        physics_set_linear_velocity(id, player_vx, player_vy);
    }
}
else
{
    // Normal hit: transfer the current Player velocity once.
    physics_set_linear_velocity(other.id, player_vx, player_vy);
    physics_set_linear_velocity(id, player_vx, player_vy);
}
