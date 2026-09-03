// =====================================
// PLAYER -> BALL PUSH
// =====================================

if (instance_exists(other))
{
    // ---------------------------------
    // Player movement
    // ---------------------------------

    var push_x = hspeed;
    var push_y = vspeed;

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


    // =================================
    // FIND BALL CONTACT
    // =================================

    var left  = place_meeting(other.x - 2, other.y, Obj_Ground);
    var right = place_meeting(other.x + 2, other.y, Obj_Ground);

    var up    = place_meeting(other.x, other.y - 2, Obj_Ground);
    var down  = place_meeting(other.x, other.y + 2, Obj_Ground);


    // =================================
    // REMOVE ONLY THE PUSH THAT GOES
    // INTO THE SURFACE
    // =================================

    if (add_x < 0 && left)
    {
        add_x = 0;
    }

    if (add_x > 0 && right)
    {
        add_x = 0;
    }

    if (add_y < 0 && up)
    {
        add_y = 0;
    }

    if (add_y > 0 && down)
    {
        add_y = 0;
    }


    // =================================
    // APPLY PUSH
    // =================================

    other.hspeed += add_x;
    other.vspeed += add_y;


    // =================================
    // MAX SPEED
    // =================================

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