// =====================================
// BALL MOVEMENT
// =====================================

var move_x = hspeed;
var move_y = vspeed;


// =====================================
// HORIZONTAL
// =====================================

if (move_x != 0)
{
    x += move_x;

    if (place_meeting(x, y, Obj_Ground))
    {
        x -= move_x;

        // اگر از چپ به دیوار خورده
        if (move_x > 0)
        {
            while (place_meeting(x + 1, y, Obj_Ground))
            {
                x -= 1;
            }
        }

        // اگر از راست به دیوار خورده
        else
        {
            while (place_meeting(x - 1, y, Obj_Ground))
            {
                x += 1;
            }
        }

        // Bounce
        hspeed = -abs(hspeed) * sign(move_x);
    }
}


// =====================================
// VERTICAL
// =====================================

if (move_y != 0)
{
    y += move_y;

    if (place_meeting(x, y, Obj_Ground))
    {
        y -= move_y;

        // از بالا به Ground
        if (move_y > 0)
        {
            while (place_meeting(x, y + 1, Obj_Ground))
            {
                y -= 1;
            }
        }

        // از پایین به سقف
        else
        {
            while (place_meeting(x, y - 1, Obj_Ground))
            {
                y += 1;
            }
        }

        // Bounce
        vspeed = -abs(vspeed) * sign(move_y);
    }
}


// =====================================
// IMPORTANT:
// PREVENT VELOCITY INTO GROUND
// =====================================

if (place_meeting(x + 1, y, Obj_Ground) && hspeed > 0)
{
    hspeed = 0;
}

if (place_meeting(x - 1, y, Obj_Ground) && hspeed < 0)
{
    hspeed = 0;
}

if (place_meeting(x, y + 1, Obj_Ground) && vspeed > 0)
{
    vspeed = 0;
}

if (place_meeting(x, y - 1, Obj_Ground) && vspeed < 0)
{
    vspeed = 0;
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