
///@function aspect_automatic()
///@description Use this function to detect any screen changes (step event)
function aspect_automatic() {
	if(window_get_width()!=global.bcresolution[0] || window_get_height()!=global.bcresolution[1]){
		if(window_get_width()>0 && window_get_height()>0){
			global.bcresolution[0]=window_get_width();
			global.bcresolution[1]=window_get_height();
		}
		//change resolution
		view_enabled = true;
	
		var ww = global.bcresolution[0];
		var hh = global.bcresolution[1];
		var scale = global.bcresolution_scale;
	
		camera_set_view_size(view_camera[0],ww,hh);
		window_set_size(ww*scale,hh*scale);
		surface_resize(application_surface,ww*scale,hh*scale);

		display_set_gui_size(ww,hh);

	}
}

///@function aspect_reset()
///@description Use it once to reset the screen aspect
function aspect_reset() {
	if(window_get_fullscreen()){
		var ww = display_get_width();
		var hh = display_get_height();
		var scale = global.bcresolution_scale;
	}	else	{
		var ww = global.bcresolution[0];
		var hh = global.bcresolution[1];
		var scale = global.bcresolution_scale;
	}

	//change resolution
	view_enabled = true;
	view_visible[0] = true;

	global.bccamera = camera_create_view(0,0,ww,hh);

	view_set_camera(0,global.bccamera);

	window_set_size(ww*scale,hh*scale);
	surface_resize(application_surface,ww*scale,hh*scale);

	display_set_gui_size(ww,hh);

	//center screen
	var display_w = display_get_width();
	var display_h = display_get_height();
	var screen_w = ww*scale;
	var screen_h = hh*scale;

	window_set_position(display_w/2-screen_w/2,display_h/2-screen_h/2);
}

///@function aspect_set_resolution(width,height,scale)
///@param {real} width
///@param {real} height
///@param {real} scale
function aspect_set_resolution(_width, _height, _scale) {
	global.bcresolution[0] = _width;
	global.bcresolution[1] = _height;
	global.bcresolution_scale = _scale;
}

