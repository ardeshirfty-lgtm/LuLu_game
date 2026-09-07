gravity = 0;
depth = 0;

health = 50;
gravity_direction = 270;

mode = "normal";
animation_eating_timer = 0;
state = "idle";
timer = 0;

// Floaty / jetpack-style movement (Physics World)
moving = false;
target_x = x;
target_y = y;
move_speed = 0;
max_speed = 7;
acceleration = 0.45;
deceleration = 0.10;

// Ball push / stick behavior
attached_ball = noone;
ball_stick_angle = 60;

invincible = false;
invincible_time = 0;
blink_timer = 0;
