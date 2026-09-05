/*/ =====================================
// PLAYER -> BALL PUSH
// =====================================

if (instance_exists(other))
{
    // ---------------------------------
    // PLAYER MOVEMENT
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
    // PUSH STRENGTH
    // ---------------------------------

    var push_strength = 0.1;

    other.pending_push_x += push_x * push_strength;
    other.pending_push_y += push_y * push_strength;


    // ---------------------------------
    // LIMIT PENDING PUSH
    // ---------------------------------

    var push_speed = point_distance(
        0,
        0,
        other.pending_push_x,
        other.pending_push_y
    );

    var max_push = 2;

    if (push_speed > max_push)
    {
        var push_angle = point_direction(
            0,
            0,
            other.pending_push_x,
            other.pending_push_y
        );

        other.pending_push_x =
            lengthdir_x(max_push, push_angle);

        other.pending_push_y =
            lengthdir_y(max_push, push_angle);
    }
}