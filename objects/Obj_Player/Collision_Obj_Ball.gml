// Push the ball using the Player's current movement velocity.
// No Room Physics / Physics World is required.

if (instance_exists(other))
{
    // Use the player's actual movement velocity as the push direction.
    var push_x = hspeed;
    var push_y = vspeed;

    // If the player is moving through move_towards_point(), hspeed/vspeed
    // may not represent the intended movement yet, so use the target direction.
    if (point_distance(0, 0, push_x, push_y) < 0.01 && moving)
    {
        push_x = lengthdir_x(move_speed, point_direction(x, y, target_x, target_y));
        push_y = lengthdir_y(move_speed, point_direction(x, y, target_x, target_y));
    }

    // Push strength.
    var push_strength = 0.85;

    other.hspeed += push_x * push_strength;
    other.vspeed += push_y * push_strength;

    // Prevent the ball from getting pushed beyond its own max speed.
    var ball_speed = point_distance(0, 0, other.hspeed, other.vspeed);
    if (ball_speed > other.ball_max_speed)
    {
        var ball_dir = point_direction(0, 0, other.hspeed, other.vspeed);
        other.hspeed = lengthdir_x(other.ball_max_speed, ball_dir);
        other.vspeed = lengthdir_y(other.ball_max_speed, ball_dir);
    }
}
