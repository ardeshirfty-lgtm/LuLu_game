// =====================================
// PLAYER -> BALL PUSH
// =====================================

if (!instance_exists(other))
    exit;

// Use the player's actual movement vector.
var push_x = hspeed;
var push_y = vspeed;

// If physics movement has not populated hspeed/vspeed, use the movement target.
if (point_distance(0, 0, push_x, push_y) < 0.01 && moving)
{
    var push_dir = point_direction(x, y, target_x, target_y);
    push_x = lengthdir_x(move_speed, push_dir);
    push_y = lengthdir_y(move_speed, push_dir);
}

// Push only in the direction the player is actually moving.
var push_strength = 0.35;

if (!variable_instance_exists(other, "pending_push_x"))
    other.pending_push_x = 0;

if (!variable_instance_exists(other, "pending_push_y"))
    other.pending_push_y = 0;

other.pending_push_x += push_x * push_strength;
other.pending_push_y += push_y * push_strength;

// Limit accumulated push so the ball cannot explode to extreme speed.
var push_speed = point_distance(0, 0, other.pending_push_x, other.pending_push_y);
var max_push = 4;

if (push_speed > max_push)
{
    var push_angle = point_direction(0, 0, other.pending_push_x, other.pending_push_y);
    other.pending_push_x = lengthdir_x(max_push, push_angle);
    other.pending_push_y = lengthdir_y(max_push, push_angle);
}
