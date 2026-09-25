// =====================================
// PLAYER MOVEMENT - NO PHYSICS WORLD
// =====================================

var vx = move_vx;
var vy = move_vy;
var decel = deceleration;

// =====================================
// NORMAL MOVEMENT
// =====================================

if (state != "grab")
{
    if (mouse_check_button(mb_left))
    {
        target_x = mouse_x;
        target_y = mouse_y;
        moving = true;

        var target_dir = point_direction(x, y, target_x, target_y);
        var desired_x = lengthdir_x(max_speed, target_dir);
        var desired_y = lengthdir_y(max_speed, target_dir);

        // Smooth acceleration toward the mouse.
        if (vx < desired_x)
            vx = min(vx + acceleration, desired_x);
        else
            vx = max(vx - acceleration, desired_x);

        if (vy < desired_y)
            vy = min(vy + acceleration, desired_y);
        else
            vy = max(vy - acceleration, desired_y);
    }
    else
    {
        moving = false;

        // Slowly lose momentum.
        if (abs(vx) <= decel)
            vx = 0;
        else
            vx -= sign(vx) * decel;

        if (abs(vy) <= decel)
            vy = 0;
        else
            vy -= sign(vy) * decel;
    }

    // =====================================
    // MANUAL GROUND COLLISION
    // =====================================

    if (!place_meeting(x + vx, y, Obj_Ground))
        x += vx;
    else
        vx = 0;

    if (!place_meeting(x, y + vy, Obj_Ground))
        y += vy;
    else
        vy = 0;

    // =====================================
    // PUSH BALL
    // =====================================

    if (moving)
    {
        var hit_ball = instance_place(x, y, Obj_Ball);

        if (hit_ball != noone)
        {
            hit_ball.ball_vx = vx;
            hit_ball.ball_vy = vy;
        }
    }
}


// =====================================
// RIGHT CLICK GRAB
// Player sticks above the Ball while
// Right Click is held.
// =====================================

if (mouse_check_button(mb_right))
{
    if (state != "grab")
    {
        var nearby_ball = instance_nearest(x, y, Obj_Ball);

        if (nearby_ball != noone)
        {
            var grab_distance = point_distance(x, y, nearby_ball.x, nearby_ball.y);

            if (grab_distance <= 80)
            {
                attached_ball = nearby_ball;
                state = "grab";
            }
        }
    }

    if (state == "grab")
    {
        if (instance_exists(attached_ball))
        {
            x = attached_ball.x;
            y = attached_ball.y - 40;

            vx = 0;
            vy = 0;
            moving = false;
        }
        else
        {
            attached_ball = noone;
            state = "idle";
        }
    }
}
else
{
    // Release immediately when Right Click is released.
    if (state == "grab")
    {
        attached_ball = noone;
        state = "idle";
    }
}


// =====================================
// SAVE MOVEMENT
// =====================================

move_vx = vx;
move_vy = vy;
move_speed = point_distance(0, 0, vx, vy);


// =====================================
// FACE MOUSE
// =====================================

if (mouse_x < x)
    image_xscale = -1;
else if (mouse_x > x)
    image_xscale = 1;


// =====================================
// ANIMATION / NET LOGIC
// =====================================

if (sprite_index == Player_eating)
{
    if (image_index >= image_number - 1)
    {
        sprite_index = SP_Player;
        image_index = 0;
    }
}

if (sprite_index == Sp_burning)
{
    if (invincible == false)
    {
        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;
    }
}

if (net_trapped)
{
    net_timer--;

    if (net_timer <= 0)
    {
        net_trapped = false;
        sprite_index = SP_Player;
        image_index = 0;
        image_speed = 1;
        net_cooldown = room_speed;
    }
}


// =====================================
// PLAYER HEALTH
// =====================================

if (health <= 0)
    room_restart();
