// شروع انیمیشن خوردن بدون متوقف کردن حرکت Player
sprite_index = Player_eating;
image_index = 0;
image_speed = 1;

// Enemy همان لحظه خورده می‌شود
instance_destroy(other);
