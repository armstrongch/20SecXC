//move runners in position order, (runner in first place moves first)
runners_ahead_counter = 0;
while (runners_ahead_counter <= instance_number(Runner_obj))
{
    with (Runner_obj)
    {
        if (runners_ahead == ScrollManager_obj.runners_ahead_counter)
        {
            move_runner();
        }
    }
    runners_ahead_counter += 1;
}

//players speed dictates camera scroll speed
scroll_speed -= Player_obj.y_dif;

//only start calculating finish line distance "for real" after 15 seconds have elapsed, to make SURE the race doesn't last more than 20
if (race_timer <= 450)
{
    player_distance_from_finish = max_player_distance_from_finish * (1 - race_timer/600);
}
else
{  
    player_distance_from_finish -= abs(scroll_speed);
}

//Draw distance markers
if (next_15_dist >= 15)
{
    var top_tree = instance_nearest(room_width*0.6, -100, Tree_obj);
    top_tree_dist = player_distance_from_finish - (abs(y - Player_obj.y));
    if (top_tree_dist <= next_15_marker)
    {
        top_tree.sprite_index = DistanceMarker_obj;
        top_tree.distance_text = string(next_15_dist);
        next_15_marker -= max_player_distance_from_finish*0.1;
        next_15_dist -= 15;
    }
}


FinishLine_obj.y = Player_obj.y - player_distance_from_finish;
