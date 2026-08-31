
if (!net_trapped && net_cooldown <= 0)
{
    // گیر افتادن در تور
    net_trapped = true;

    // مدت گیر افتادن
    net_timer = room_speed * 1.5;

    // مدت زمان جلوگیری از گیر افتادن دوباره
    net_cooldown = room_speed * 2;

    // جهت خروج از تور
    net_exit_direction = point_direction(other.x, other.y, xprevious, yprevious);

    // توقف حرکت
    moving = false;
    hspeed = 0;
    vspeed = 0;
    speed = 0;

    // قرار گرفتن داخل تور
    x = other.x;
    y = other.y;

    // انیمیشن
    sprite_index = Sp_burning;
    image_index = 0;
    image_speed = 1;

    // Damage
    if (!invincible)
    {
        health -= 1;

        invincible = true;
        invincible_time = room_speed * 2;
    }
}

