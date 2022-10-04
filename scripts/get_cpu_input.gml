up_pressed = false;
down_pressed = false;
right = false;
left = false

//Merge right if possible
if (column_x < ScrollManager_obj.rightmost_trail_x)
{
    right = true;
}
