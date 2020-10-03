/// @description Player control

input.update();

if (targetInputMouse) {
	if ((input.horizontalr_old != abs(input.gp_axis_rx)) or (input.verticalr_old != abs(input.gp_axis_ry))) {
		targetInputMouse = false;
	} else {
		targetInputMouse = true;
	}
} else {
	if ((mouse_xprevious != mouse_x) or (mouse_yprevious != mouse_y)) {
		targetInputMouse = true;
	} else {
		targetInputMouse = false;
	}
}

targetInputMouse = false;
var targetXZero, targetYZero, targetXReal, targetYreal;
if (targetInputMouse) {
	targetXReal = mouse_x;
	targetYreal = mouse_y;
} else {
	targetXReal = x+input.gp_axis_rx;
	targetYreal = y+input.gp_axis_ry;
}

targetDirection = point_direction(x, y, targetXReal, targetYreal);
targetx = x+lengthdir_x(targetDistance, targetDirection);
targety = y+lengthdir_y(targetDistance, targetDirection);

hsp = input.movex*3;
vsp = input.movey*3;

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
