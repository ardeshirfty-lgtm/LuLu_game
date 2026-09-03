if (bounce == true)
{
    bounce_timer += 1;
}

if (bounce_timer >= 30)
{
    bounce = false;
    bounce_timer = 0;
}

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
{
    damage = true;
}

if (damage == true)
{
    health -= 5;
    
    damage = false;
    invincible = true;
    invincible_time = 30; // حدود 1 ثانیه
}


// Invincibility timer
if (invincible == true)
{
    invincible_time -= 1;

    if (invincible_time <= 0)
    {
        invincible_time = 0;
        invincible = false;
    }
}
 









