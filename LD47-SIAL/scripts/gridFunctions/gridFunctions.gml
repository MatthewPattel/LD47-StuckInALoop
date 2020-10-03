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