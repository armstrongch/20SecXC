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
