/// @DnDAction : YoYo Games.Miscellaneous.Set_Window_State
/// @DnDVersion : 1
/// @DnDHash : 2E89A44E
/// @DnDArgument : "type" "2"
window_set_fullscreen(true);

// Enable the Physics World before physics objects are created.
physics_world_create(0.1);
physics_world_gravity(0, 0);