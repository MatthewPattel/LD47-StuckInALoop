/// @description Creation variables

global.time_limit = 60;
global.time_current = 0;

var g = 0;
repeat(2) {
	global.grid_level[g] = ds_grid_create(GRID_WIDTH, GRID_HEIGHT);
	ds_grid_set_region(global.grid_level[g], 0, 0, GRID_WIDTH-1, GRID_HEIGHT-1, -1);
	
	// Check if file exists if not create it
	if (file_exists(ROUTE_LEVELDATA)) {
		ini_open(ROUTE_LEVELDATA);
		
		// Check if level section exists if not create it
		if (ini_section_exists("level")) {
			
			// Check if level number key exists if not create it
			if (ini_key_exists("level", string(g))) {
				ds_grid_read(global.grid_level[g], ini_read_string("level", string(g), ""));
			} else {
				ini_write_string("level", string(g), ds_grid_write(global.grid_level[g]));
			}
		} else {
			ini_write_string("level", string(g), ds_grid_write(global.grid_level[g]));
		}
		
		ini_close();
	} else {
		gridSaveLevel(g);
	}
	
	g++;
}






