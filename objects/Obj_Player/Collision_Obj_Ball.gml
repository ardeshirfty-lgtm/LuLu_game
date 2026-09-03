// =====================================
// PLAYER -> BALL PUSH
// =====================================

if (instance_exists(other))
{
    // ---------------------------------
    // Player movement velocity
    // ---------------------------------

    var push_x = hspeed;
    var push_y = vspeed;


    // If Player is moving with move_towards_point
    if (point_distance(0, 0, push_x, push_y) < 0.01 && moving)
    {
        var push_dir = point_direction(
            x,
            y,
            target_x,
            target_y
        );

        push_x = lengthdir_x(move_speed, push_dir);
        push_y = lengthdir_y(move_speed, push_dir);
    }


    // ---------------------------------
    // Push strength
    // ---------------------------------

    var push_strength = 0.1;

    var add_x = push_x * push_strength;
    var add_y = push_y * push_strength;


    // ---------------------------------
    // Check horizontal collision
    // ---------------------------------

    if (add_x != 0)
    {
        if (place_meeting(
            other.x + add_x,
            other.y,
            Obj_Ground
        ))
        {
            add_x = 0;
        }
    }


    // ---------------------------------
    // Check vertical collision
    // ---------------------------------

    if (add_y != 0)
    {
        if (place_meeting(
            other.x,
            other.y + add_y,
            Obj_Ground
        ))
        {
            add_y = 0;
        }
    }


    // ---------------------------------
    // Apply push
    // ---------------------------------

    other.hspeed += add_x;
    other.vspeed += add_y;


    // ---------------------------------
    // Maximum speed
    // ---------------------------------

    var ball_speed = point_distance(
        0,
        0,
        other.hspeed,
        other.vspeed
    );

    var max_ball_speed = 8;

    if (ball_speed > max_ball_speed)
    {
        var ball_dir = point_direction(
            0,
            0,
            other.hspeed,
            other.vspeed
        );

        other.hspeed = lengthdir_x(
            max_ball_speed,
            ball_dir
        );

        other.vspeed = lengthdir_y(
            max_ball_speed,
            ball_dir
        );
    }
}