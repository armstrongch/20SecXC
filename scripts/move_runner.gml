//check for collisions with all runners
for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    if (test_runner.id != self.id && place_meeting(x+x_dif, y+y_dif, test_runner))
    {   
        var adjustments = array_create(3);
        adjustments[0] = "none";
        adjustments[1] = "none";
        
        //if we are ahead of colliding runner
        if (y < test_runner.y)
        {
            //if we are trying to cut them off
            if (x_dif != 0)
            {
                //reduce x_dif until no longer colliding
                adjustments[0] = "x";
                adjustments[1] = "both";
            }
            //otherwise, they must be running too fast on our heels.
            //we'll deal with it in their collision handling instead
        }
        else
        {
            //if we are trying to cross behind a runner ahead
            if (abs(x+x_dif - x) > abs(x+x_dif - test_runner.x))
            {
                //try to reduce y first to allow for seamless crossover
                adjustments[0] = "y";
                adjustments[1] = "both";
            }
            else
            {
                adjustments[0] = "both";
            }
        }
        
        //iterate through adjustments
        for (var j = 0; j < 2; j += 1)
        {
            var x_adj_mod = 0;
            var y_adj_mod = 0;
            var x_adj = x_dif;
            var y_adj = y_dif;
            if (adjustments[j] == "x") || (adjustments[j] == "both") { x_adj_mod = x_dif/10; }
            if (adjustments[j] == "y") || (adjustments[j] == "both") { y_adj_mod = y_dif/10; }
            
            //test adjustment, and break out of loops and move if we find a successful non-colliding position
            for (var k = 0; k < 10; k += 1)
            {
                x_adj -= x_adj_mod;
                y_adj -= y_adj_mod;
                if (!place_meeting(x+x_adj, y+y_adj, test_runner))
                {
                    x_dif = x_adj;
                    y_dif = y_adj;
                    k = 10;
                    j = 2;
                }
            }
        }
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
