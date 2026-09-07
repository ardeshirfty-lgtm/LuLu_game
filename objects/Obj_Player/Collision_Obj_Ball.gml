// Stick to the Ball while the player keeps pushing in roughly the same direction.
// A strong change of mouse direction breaks the attachment.

var player_vx = phy_speed_x;
var player_vy = phy_speed_y;

if (attached_ball == noone)
{
    var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
    var player_dir = point_direction(0, 0, player_vx, player_vy);

    // Only stick when we are actually moving and pushing in roughly
    // the same direction as the mouse.
    if (mouse_check_button(mb_left) && phy_speed > 0.05)
    {
        var dir_difference = abs(angle_difference(mouse_dir, player_dir));

        if (dir_difference <= ball_stick_angle)
            attached_ball = other.id;
    }
}

if (attached_ball == other.id)
{
    var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
    var player_dir = point_direction(0, 0, player_vx, player_vy);
    var dir_difference = abs(angle_difference(mouse_dir, player_dir));

    // Release when the mouse is released or direction changes too much.
    if (!mouse_check_button(mb_left) || dir_difference > ball_stick_angle)
    {
        attached_ball = noone;
    }
    else
    {
        other.phy_speed_x = player_vx;
        other.phy_speed_y = player_vy;
    }
}
else
{
    // Normal hit: transfer the current Player speed once.
    other.phy_speed_x = player_vx;
    other.phy_speed_y = player_vy;
}
