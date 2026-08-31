target_x = mouse_x;
target_y = mouse_y;

move_speed = min(move_speed + acceleration , max_speed);

moving = true;


if place_meeting(x , y , Obj_Net ) { moving = false}
else {
	 moving = true
}





friction-=0.5
