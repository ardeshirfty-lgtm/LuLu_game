// =====================================
// BALL MOVEMENT
// =====================================

var move_x = hspeed;
var move_y = vspeed;


// =====================================
// HORIZONTAL MOVEMENT
// =====================================

if (move_x != 0)
{
    x += move_x;

    if (place_meeting(x, y, Obj_Ground))
    {
        // برگرد به موقعیت قبل از برخورد
        x -= move_x;

        // Bounce افقی
        hspeed = -hspeed;
    }
}


// =====================================
// VERTICAL MOVEMENT
// =====================================

if (move_y != 0)
{
    y += move_y;

    if (place_meeting(x, y, Obj_Ground))
    {
        // برگرد به موقعیت قبل از برخورد
        y -= move_y;

        // Bounce عمودی
        vspeed = -vspeed;
    }
}


// =====================================
// FRICTION
// =====================================

hspeed *= 0.98;
vspeed *= 0.98;


// =====================================
// ENEMY DAMAGE
// =====================================

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
{
    damage = true;
}


// =====================================
// DAMAGE
// =====================================

if (damage == true)
{
    health -= 5;

    damage = false;

    invincible = true;
    invincible_time = 30;
}


// =====================================
// INVINCIBILITY
// =====================================

if (invincible == true)
{
    invincible_time--;

    if (invincible_time <= 0)
    {
        invincible_time = 0;
        invincible = false;
    }
}