// Mouse click starts / accelerates movement toward the clicked point.
target_x = mouse_x;
target_y = mouse_y;

move_speed = min(move_speed + acceleration, max_speed);
moving = true;
