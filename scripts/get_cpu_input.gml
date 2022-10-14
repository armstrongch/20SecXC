up_pressed = false;
down_pressed = false;
right = false;
left = false

trying_to_pass_counter -= 1;
/*
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

//If not actively trying to move left, merge right whenever possible
if (trying_to_pass_counter <= 0 && column_x < ScrollManager_obj.rightmost_trail_x)
{
    right = true;
}

//If not in first place
if (global.runners_ahead > 0)
{
    //if drafting, try to pass if energy is high
    if (is_drafting)
    {
        if (energy > max_energy*0.75)
        {
            left = true;
            trying_to_pass_counter = 60;
        }
    }
    //if actively trying to pass, run faster if possible
    else if (trying_to_pass_counter > 0)
    {
        if (run_speed <= default_run_speed*2)
        {
            up_pressed = true;
        }
    }
    //if not drafting, try to move up
    else
    {
        if (energy > max_energy*0.5 && run_speed <= default_run_speed*0.25)
        {
            up_pressed = true;
        }
    }
}
//if in first place, push the pace when possible
else
{
    if (energy > max_energy*0.5 && run_speed <= default_run_speed)
    {
        up_pressed = true;
    }
    else if (energy <= max_energy*0.5 && run_speed >= default_run_speed)
    {
        down_pressed = true;
    }
}
*/
