cpu_brain_type_count = 4;
cpu_brain_types = array_create(cpu_brain_type_count);
cpu_brain_types[0] = "dumb_sprinter";
cpu_brain_types[1] = "smart_sprinter";
cpu_brain_types[2] = "dumb_merger";
cpu_brain_types[3] = "diagonal_merger";
var rand_mod = irandom(cpu_brain_type_count-1);

for (var i = 0; i < instance_number(Runner_obj); i += 1)
{
    var test_runner = instance_find(Runner_obj, i);
    test_runner.cpu_brain_type = cpu_brain_types[(i+rand_mod)%3];
}
