/// @description Move the camera

/*
camera_set_view_size(view, view_width, view_height);

if (instance_exists(obj_player)) {
	
	view_width = clamp(view_width, view_width_min, view_width_max);
	view_height = (view_width*0.5625);//0.75);//clamp(((ymayor-yminor)*1), 384, 768);
	
	var cam_x = clamp(round(obj_player.x - view_width/2), 0, round(room_width-view_width));
	var cam_y = clamp(round(obj_player.y - view_height/2), 0, round(room_height-view_height));
	
	x = cam_x;
	y = cam_y;
	
	var cur_x = camera_get_view_x(view);
	var cur_y = camera_get_view_y(view);
	
	var cam_spd = 0.01;
	
	camera_set_view_pos(view, lerp(cur_x, cam_x, cam_spd), lerp(cur_y, cam_y, cam_spd));
}
*/

x += ((xTo-x)/15);
y += ((yTo-y)/10);

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
