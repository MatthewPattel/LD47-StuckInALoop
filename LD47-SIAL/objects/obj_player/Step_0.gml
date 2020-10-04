/// @description Player control

input.update();

if (gamepad_is_connected(0)) {
	time = ((input.gp_axis_rx == 1) or (input.gp_axis_ry == 1)) ? time+0.2 : 0;
	target.tAlign(input.gp_axis_rx*(speedTarget+(time*2)), input.gp_axis_ry*(speedTarget+(time*2)));
} else {
	target.tx = mouse_x;
	target.ty = mouse_y;
}

target.tUpdateCoordinates();

var inst_near = (collision_line_point(x, y, target.tx, target.ty, obj_time_dependant, false, true));

target.tx = inst_near[1];
target.ty = inst_near[2];

target.tUpdateCoordinates();

if (inst_near[0] != noone) {
	inst_near[0].selected = true;
	if (input.interact) gridSetTimeActivation(inst_near[0]);
}

hsp = input.movex*speedMove;
vsp = input.movey*speedMove;

// Align pixel perfect in x
hsp_final = hsp + hsp_f;
hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
hsp_final -= hsp_f;

// Align pixel perfect in y
vsp_final = vsp + vsp_f;
vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
vsp_final -= vsp_f;

x += hsp_final
y += vsp_final;
