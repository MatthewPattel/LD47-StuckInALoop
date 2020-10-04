/// @description Creation variables

image_xscale = DRAW_SCALE;
image_yscale = DRAW_SCALE;

input = new inputGame();

hsp = 0;
hsp_final = 0;
hsp_f = 0;

vsp = 0;
vsp_final = 0;
vsp_f = 0;

targetTime = 0;
speedTarget = 5;
speedMove = 3;

target = {
	tx: obj_player.x+lengthdir_x(CELL_SIZE*4, 0),
	ty: obj_player.y+lengthdir_y(CELL_SIZE*4, 0),
	
	hsp: 0,
	hsp_final: 0,
	hsp_f: 0,

	vsp: 0,
	vsp_final: 0,
	vsp_f: 0,
	
	tAlign: function(hsp_real, vsp_real) {
		
		hsp = hsp_real;
		vsp = vsp_real;
		
		// Align pixel perfect in x
		hsp_final = hsp + hsp_f;
		hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
		hsp_final -= hsp_f;

		// Align pixel perfect in y
		vsp_final = vsp + vsp_f;
		vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
		vsp_final -= vsp_f;
		
		tx += hsp_final;
		ty += vsp_final;
	},
	
	tUpdateCoordinates: function() {
		// Get coordinates and border to clamp
		static viewborder = CELL_SIZE;
		var diffw = (obj_camera.view_width/2)-viewborder;
		var diffh = (obj_camera.view_height/2)-viewborder;
		
		tx = clamp(tx, obj_camera.x-diffw, obj_camera.x+diffw);
		ty = clamp(ty, obj_camera.y-diffh, obj_camera.y+diffh);
		
		obj_target.x = tx;
		obj_target.y = ty;
	}
}

var t = instance_create_layer(target.tx, target.ty, "Instances", obj_target);
with(t) {
	image_xscale = DRAW_SCALE;
	image_yscale = DRAW_SCALE;
}
