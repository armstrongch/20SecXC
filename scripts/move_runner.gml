//check for collisions with all runners
for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    if (test_runner.id != self.id && place_meeting(x+x_dif, y+y_dif, test_runner))
    {   
        var successfully_resolved_collision = false;
        if (other.y < y)
        {
            show_debug_message('*****************START OF COLLISION TEST*****************');
            show_debug_message('x_dif: ' + string(x_dif));
            show_debug_message('y_dif: ' + string(y_dif));
            //measure distance to colliding runner
            var target_dist_from_other = point_distance(x+x_dif, y+y_dif, test_runner.x, test_runner.y);
            show_debug_message('target_dist_from_other: ' + string(target_dist_from_other));
            
            //measure direction of colliding runner
            var move_dir = point_direction(0, 0, x_dif, y_dif);
            show_debug_message('move_dir: ' + string(move_dir));
            
            //create 2 new potential directions - 10 degrees clockwise and 10 degrees counter
            var add_10_deg_test = move_dir + 10;
            var sub_10_deg_test = move_dir - 10;
            show_debug_message('add_10_deg_test: ' + string(add_10_deg_test));
            show_debug_message('sub_10_deg_test: ' + string(sub_10_deg_test));
            
            //current move distance
            var move_dist = point_distance(0, 0, x_dif, y_dif);
            show_debug_message('move_dist: ' + string(move_dist));
            
            //get the positions of both potential moves
            var add_test_x_dif = cos(add_10_deg_test/180*pi)*move_dist;
            var add_test_y_dif = -sin(add_10_deg_test/180*pi)*move_dist;
            show_debug_message('add_test_x_dif: ' + string(add_test_x_dif));
            show_debug_message('add_test_y_dif: ' + string(add_test_y_dif));
            
            var sub_test_x_dif = cos(sub_10_deg_test/180*pi)*move_dist;
            var sub_test_y_dif = -sin(sub_10_deg_test/180*pi)*move_dist;
            show_debug_message('sub_test_x_dif: ' + string(sub_test_x_dif));
            show_debug_message('sub_test_y_dif: ' + string(sub_test_y_dif));
            
            //get the distance of both potential moves to colliding runner
            var add_test_dist_from_other = point_distance(x+add_test_y_dif, y+add_test_y_dif, test_runner.x, test_runner.y);
            var sub_test_dist_from_other = point_distance(x+sub_test_x_dif, y+sub_test_y_dif, test_runner.x, test_runner.y);
            show_debug_message('add_test_dist_from_other: ' + string(add_test_dist_from_other));
            show_debug_message('sub_test_dist_from_other: ' + string(sub_test_dist_from_other));
            
            var angle_adj_attempts = 10;
            //use the results of the previous test to determine whether we should adjust movement clockwise or counter to avoid collision
            var angle_adj_amount = 9;
            if (sub_test_dist_from_other > add_test_dist_from_other) { angle_adj_amount = -9; }
            
            for (var j = 0; j < angle_adj_attempts; j += 1)
            {
                var test_dir = move_dir + j*angle_adj_amount;
                var test_x_dif= cos(test_dir/180*pi)*move_dist;
                var test_y_dif = sin(test_dir/180*pi)*move_dist;
                show_debug_message('test_dir: ' + string(test_dir));
                show_debug_message('test_x_dif: ' + string(test_x_dif));
                show_debug_message('test_y_dif: ' + string(test_y_dif));
                
                if (!place_meeting(x+test_x_dif, y+test_y_dif, test_runner))
                {
                    j = angle_adj_attempts + 1;
                    x_dif = test_x_dif;
                    y_dif = test_y_dif;
                    show_debug_message('SUCCESS!');
                    show_debug_message('x_dif: ' + string(x_dif));
                    show_debug_message('y_dif: ' + string(y_dif));
                    successfully_resolved_collision = true;
                }
            }
            show_debug_message('*****************END OF COLLISION TEST*****************');
        }
        
        if (!successfully_resolved_collision)
        {
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
