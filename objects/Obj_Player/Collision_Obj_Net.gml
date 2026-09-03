/*
if (!net_trapped && net_cooldown <= 0)
{
    // گیر افتادن در تور
    net_trapped = true;

    // مدت گیر افتادن = 2 ثانیه
    net_timer = room_speed * 2;

    // توقف حرکت
    moving = false;
    hspeed = 0;
    vspeed = 0;
    speed = 0;

    // انیمیشن تور
    sprite_index = Sp_burning;
    image_index = 0;
    image_speed = 1;

    // Damage
    if (!invincible)
    {
        health -= 1;

        invincible = true;
        invincible_time = room_speed * 0.5;
    }
}


