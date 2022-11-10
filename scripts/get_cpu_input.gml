up = false;
down = false;
right = false;
left = false;

var percent_race_over = ScrollManager_obj.player_distance_from_finish / ScrollManager_obj.max_player_distance_from_finish;
var percent_energy_used = energy/max_energy;

if (cpu_brain_state_counter > 0) { cpu_brain_state_counter -= 1; }
else { cpu_brain_state = "none"; }

if (cpu_brain_state != "none")
{
    switch(cpu_brain_state)
    {
        case "up": up = true; break;
        case "down": down = true; break;
        case "left": left = true; break;
        case "right": right = true; break;
        
        case "up_left": up = true; left = true; break;
        case "down_left": down = true; left = true; break;
        case "up_right": up = true; right = true; break;
        case "down_right": down = true; right = true; break;
    }
}
else
{
    switch(cpu_brain_type)
    {
        case "dumb_sprinter":
            up = true;
            break;
        case "smart_sprinter":
            up = (percent_energy_used >= floor(percent_race_over*10)/10);
            break;
        case "dumb_merger":
            if (percent_energy_used > 0.5)
            {
                if (is_drafting) { cpu_brain_state = "left"; }
                else { cpu_brain_state = "up"; }
            }
            else if (!is_drafting) { cpu_brain_state = "right"; }
            cpu_brain_state_counter = 15;
            break;
        case "diagonal_merger":
            if (percent_race_over < 0.5)
            {
                if (is_drafting) { cpu_brain_state = "up_left"; }
                else { cpu_brain_state = "up"; }
            }
            else if (abs(x < ScrollManager_obj.leftmost_trail_x) > 64)
            {
                cpu_brain_state = "down_left";
            }
            else if (!is_drafting)
            {
                cpu_brain_state = "up";
            }
            cpu_brain_state_counter = 15;
            break;
        case "random_drifter":
            var rand_int = irandom(5);
            switch(rand_int)
            {
                case 0:
                    cpu_brain_state = "left";
                    break;
                case 1:
                    cpu_brain_state = "right";
                    break;
                default:
                    cpu_brain_state = "up";
                    break;
            }
            cpu_brain_state_counter = 15;
            break;
        case "player_watcher":
            if (y > Player_obj.y)
            {
                cpu_brain_state = "up";
            }
            else
            {
                var rand_int = irandom(10);
                if (rand_int == 1) { cpu_brain_state = "right"; }
                else if (rand_int == 2) { cpu_brain_state = "left"; }
                else if (rand_int < 7) { cpu_brain_state = "down"; }
            }
            cpu_brain_state_counter = 90;
            
            break;
    }
}
