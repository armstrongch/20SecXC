up_pressed = false;
down_pressed = false;
right = false;
left = false

//Get runners ahead
global.runner_check_y = y;
global.runners_ahead = 0;
with (Runner_obj)
{
    if (y < global.runner_check_y)
    {
        global.runners_ahead += 1;
    }
}

//If not in first place
if (global.runners_ahead > 0)
{
    if (energy > 0.5 && run_speed <= default_run_speed)
    {
        up_pressed = true;
    }
}

//Merge right if possible
if (column_x < ScrollManager_obj.rightmost_trail_x)
{
    right = true;
}
