//check for collisions with all runners
for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    if (test_runner.id != self.id && place_meeting(x+x_dif, y+y_dif, test_runner))
    {
        //shorten move to avoid collision
        dist_from_other = point_distance(test_runner.x, test_runner.y, x+x_dif, y+y_dif);
        adj_x = test_runner.x + cos(dist_from_other/180*pi)*64;
        adj_y = test_runner.y - sin(dist_from_other/180*pi)*64;
        y_dif = adj_y - y;
        x_dif = adj_x - x;
        //if colliding runner is ahead, slow down
        if (test_runner.y < y)
        {
            //run_speed = test_runner.run_speed - test_runner.column_mod + column_mod;
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
