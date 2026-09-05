

// =====================================
// BALL PHYSICS
// =====================================

var fix = physics_fixture_create();

physics_fixture_set_circle_shape(fix, sprite_width / 2);

physics_fixture_set_density(fix, 1);
physics_fixture_set_friction(fix, 0.1);
physics_fixture_set_restitution(fix, 0.9);
physics_fixture_set_linear_damping(fix, 0.2);
physics_fixture_set_angular_damping(fix, 1);

physics_fixture_bind(fix, id);
physics_fixture_delete(fix);


// =====================================
// ENEMY DAMAGE
// =====================================

if (place_meeting(x, y, Obj_Enemy) && invincible_time <= 0)
{
    damage = true;
}


// =====================================
// DAMAGE
// =====================================

if (damage == true)
{
    health -= 5;

    damage = false;

    invincible = true;
    invincible_time = 30;
}


// =====================================
// INVINCIBILITY
// =====================================

if (invincible == true)
{
    invincible_time--;

    if (invincible_time <= 0)
    {
        invincible_time = 0;
        invincible = false;
    }
}