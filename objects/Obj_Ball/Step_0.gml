// =====================================
// BALL - PHYSICS WORLD
// =====================================
//
// Movement, collision resolution and bounce are handled by
// the Room Physics World. Only gameplay damage logic remains here.

// =====================================
// ENEMY DAMAGE
// =====================================

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
    damage = true;

if (damage == true)
{
    health -= 5;
    damage = false;
    invincible = true;
    invincible_time = 30;
}

if (invincible == true)
{
    invincible_time--;

    if (invincible_time <= 0)
    {
        invincible_time = 0;
        invincible = false;
    }
}
