/// @description Countdown

global.time_current++;

if (global.time_current >= global.time_limit) {
	room_restart();
	exit;
}

show_debug_message("time "+string(global.time_current));
for (var gy = 0 ; gy < GRID_HEIGHT ; gy++) {
	for (var gx = 0 ; gx < GRID_WIDTH ; gx++) {
		var value = global.grid_level[@ level][# gx, gy];
		
		if (value <= global.time_current) {
			
			var truex = (gx*CELL_SIZE)+CELL_HALF;
			var truey = (gy*CELL_SIZE)+CELL_HALF;
			
			var inst_list = ds_list_create();
			instance_position_list(truex, truey, obj_time_dependant, inst_list, false);
			var inst_list_size = ds_list_size(inst_list);
			
			if (inst_list_size > 0) {
				for (var i = 0 ; i < inst_list_size ; i++) {
					with(inst_list[| i]) {
						if (!active_old) active = true;
					}
				}
			}
		}
	}
}

alarm[0] = room_speed;
