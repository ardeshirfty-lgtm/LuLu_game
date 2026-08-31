
if (!net_trapped && net_cooldown <= 0)
{
    // گیر افتادن در تور
    net_trapped = true;
    net_timer = room_speed * 1;

    // جلوگیری از گیر کردن دوباره
    net_cooldown = room_speed * 2;

    // توقف حرکت
    moving = false;
    hspeed = 0;
    vspeed = 0;
    speed = 0;

    // قرار گرفتن روی تور
    x = other.x;
    y = other.y;

    // انیمیشن گیر افتادن
    sprite_index = Sp_burning;
    image_index = 0;
    image_speed = 1;

    // Damage
    if (!invincible)
    {
        health -= 1;

        // 2 ثانیه ضدضربه
        invincible = true;
        invincible_time = room_speed * 2;
    }
}

