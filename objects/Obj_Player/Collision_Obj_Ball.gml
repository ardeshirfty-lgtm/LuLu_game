// Player hits Ball: transfer the Player's current velocity to the Ball.
// Both bodies use zero restitution for this contact, so the Player does not bounce backward.

var player_vx = physics_get_linear_velocity_x(id);
var player_vy = physics_get_linear_velocity_y(id);

physics_set_linear_velocity(other.id, player_vx, player_vy);
physics_set_linear_velocity(id, player_vx, player_vy);
