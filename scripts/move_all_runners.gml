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
FinishLine_obj.y = Player_obj.y - player_distance_from_finish;
