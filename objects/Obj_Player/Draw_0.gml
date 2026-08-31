
if (invincible)
{
    // هر 5 فریم بین قرمز و سفید عوض شود
    if ((invincible_time div 5) mod 2 == 0)
    {
        image_blend = c_red;
    }
    else
    {
        image_blend = c_white;
    }

    draw_self();

    // حتماً برگردانیم به حالت عادی
    image_blend = c_white;
}
else
{
    draw_self();
}