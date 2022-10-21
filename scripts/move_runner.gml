//check for collisions with all runners
for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    if (test_runner.id != self.id && place_meeting(x+x_dif, y+y_dif, test_runner))
    {   
        //from here: https://forum.yoyogames.com/index.php?threads/circular-collision.9820/
        var max_dist = 62;
        var d = point_distance(test_runner.x, test_runner.y, x+x_dif, y+y_dif);
        d = max_dist / d;
        var x_adj = test_runner.x + ((x+x_dif - test_runner.x) * d);
        var y_adj = test_runner.y + ((y+y_dif - test_runner.y) * d);
        
        x_dif = x_adj - x;
        y_dif = y_adj - y;
    }
}

//move based on x_dif/y_dif
y += y_dif;
x += x_dif;

//draft off runners ahead
runner_ahead = collision_rectangle(x+16, y+y_dif - 32, x+48, y+32, Runner_obj, false, true);
if (runner_ahead != noone)
{
    energy = min(max_energy, energy+1);
    is_drafting = true;
}
else
{
    is_drafting = false;
}
