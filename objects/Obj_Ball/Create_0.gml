
ball_max_speed = 18;

bounce = false;
bounce_timer = 0;
bounce_power = 0.7;


health = 50;
invincible = false;
invincible_time = 0;
damage = false;


// Ball movement
x += hspeed;
y += vspeed;

// Friction
hspeed *= 0.98;
vspeed *= 0.98;