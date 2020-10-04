// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gridSaveLevel(level_num) {
	ini_open(ROUTE_LEVELDATA);
	
	ini_write_string("level", string(level_num), ds_grid_write(global.grid_level[level_num]));
	
	ini_close();
}

function gridLoadLevel(level_num) {
	ini_open(ROUTE_LEVELDATA);
	
	ds_grid_read(global.grid_level[level_num], ini_read_string("level", string(level_num), ""));
	
	ini_close();
}

function gridSetTimeActivation(instId) {
	var lvl = obj_controller_level.level;
	
	var xcell = instId.x div CELL_SIZE;
	var ycell = instId.y div CELL_SIZE;
	
	var grid = global.grid_level[lvl];
	
	show_debug_message("level"+string(lvl));
	show_debug_message("xcell"+string(xcell));
	show_debug_message("ycell"+string(ycell));
	
	show_debug_message("grid"+string(global.grid_level[@ lvl][# xcell, ycell]));
	
	if (global.grid_level[@ lvl][# xcell, ycell] == -1) {
		global.grid_level[@ lvl][# xcell, ycell] = global.time_current;
		instId.active = true;
		show_debug_message("active "+object_get_name(instId.object_index));
	} else {
		instId.invalid = true;
		show_debug_message("invalid "+object_get_name(instId.object_index));
	}
}
