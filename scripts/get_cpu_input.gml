up_pressed = false;
down_pressed = false;
right = false;
left = false

trying_to_pass_counter -= 1;

//If not actively trying to move left, merge right whenever possible
if (trying_to_pass_counter <= 0 && x < ScrollManager_obj.rightmost_trail_x)
{
    right = true;
}

//If not in first place
if (runners_ahead > 0)
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
    // if actively trying to pass or not drafting, run faster if possible
    else if (trying_to_pass_counter > 0) || (energy > max_energy*0.5)
    {
        up = true;
    }
}
//if in first place, push the pace when possible
else
{
    if (energy > max_energy*0.5)
    {
        up = true;
    }
    else if (energy <= max_energy*0.5)
    {
        down = true;
    }
}

