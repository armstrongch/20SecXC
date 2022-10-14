//check for collisions with all runners
for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    if (test_runner.id != self.id && place_meeting(x+x_dif, y+y_dif, test_runner))
    {   
        /*
        var short_dist_attempts = 10;
        var x_dif_mod = x_dif/short_dist_attempts;
        var y_dif_mod = y_dif/short_dist_attempts;
        
        //reduce attempted move distance until no longer colliding
        for (var j = 0; j < short_dist_attempts; j += 1)
        {
            x_dif -= x_dif_mod;
            y_dif -= y_dif_mod;
            if (!place_meeting(x+x_dif, y+y_dif, test_runner))
            {
                j = short_dist_attempts + 1;
            }
        }
        */
    }
}

//players speed dictates camera scroll speed
if (is_player)
{
    ScrollManager_obj.scroll_speed -= y_dif;
    y_dif = 0;
}

y += y_dif;
x += x_dif;

//costs energy to run fast, saves energy running slow
/*if (run_speed > default_run_speed)
{
    speed_dif = run_speed - default_run_speed;
    energy -= speed_dif/4;
    if (energy <= 0)
    {
        energy = 0;
        run_speed = default_run_speed - 2;
    }
}
else if (run_speed < default_run_speed)
{
    speed_dif = default_run_speed - run_speed;
    energy += speed_dif/6;
}*/

//draft off runners ahead
/*runner_ahead = collision_rectangle(x+8, y+y_dif - 32, x+56, y+32, Runner_obj, false, true);
if (runner_ahead != noone)
{
    energy += 1;
    is_drafting = true;
}
else
{
    is_drafting = false;
}
if (energy > max_energy)
{
    energy = max_energy;
}*/
