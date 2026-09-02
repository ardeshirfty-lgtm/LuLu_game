if bounce = true
 {
if ! place_free( x+1 , y+1 ) {motion_add( direction + 180 , 8  ) }
if ! place_free( x-1 , y-1 ) {motion_add( direction + 180 , 8 ) }
}