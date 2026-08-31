

var _proj = instance_create_depth(x - 20, y - 50, -5, Obj_projectile);

if (image_xscale == -1) {
    // پلیر رو به چپه
    _proj.hspeed = -10;
    _proj.image_xscale = -1;
} else {
    // پلیر رو به راسته
    _proj.hspeed = 6;
    _proj.image_xscale = 1;
}
