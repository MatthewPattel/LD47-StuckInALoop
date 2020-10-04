/// @description Creation variables

window_set_size(1600, 900);
alarm[0] = 2;

view = view_camera[0];

view_width = 240*DRAW_SCALE;
view_height = 135*DRAW_SCALE;

view_width_min = 240*DRAW_SCALE;	//240*135
view_width_max = 288*DRAW_SCALE;	//288*162
/*
if (instance_exists(obj_player)) {
	
	view_width = clamp(view_width, view_width_min, view_width_max);
	view_height = (view_width*0.5625);//0.75);//clamp(((ymayor-yminor)*1), 384, 768);
	
	var cam_x = clamp(round(obj_player.x - view_width/2), 0, round(room_width-view_width));
	var cam_y = clamp(round(obj_player.y - view_height/2), 0, round(room_height-view_height));
	
	x = cam_x;
	y = cam_y;
}

camera_set_view_pos(view, cam_x, cam_y);
camera_set_view_size(view, view_width, view_height);
*/

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_width, view_height, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = obj_player;
xTo = x;
yTo = y;
