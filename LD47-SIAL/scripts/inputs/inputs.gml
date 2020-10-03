// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function inputGame(input_menu) constructor {
	
	menu = (is_undefined(input_menu)) ? false : input_menu;
	
	up = false;
	down = false;
	left = false;
	right = false;
	
	movey = 0;
	movex = 0;
	
	verticall_old = false;
	horizontall_old = false;
	
	verticalr_old = false;
	horizontalr_old = false;
	
	accept = false;
	cancel = false;
	
	gp_axis_lx = 0;
	gp_axis_ly = 0;
	gp_axis_rx = 0;
	gp_axis_ry = 0;
	
	update = function() {
		var gp_axisx = 0;
		var gp_axisy = 0;
			
		var face1 = false;
		var face1_hold = false;
		var face2 = false;
		var face2_hold = false;
		var face3 = false;
		var face3_hold = false;
		var face4 = false;
		var face4_hold = false;
			
		var shoulderLB = false;
		var shoulderLT = false;
		var shoulderRB = false;
		var shoulderRT = false;
		var shoulderLB_hold = false;
		var shoulderLT_hold = false;
		var shoulderRB_hold = false;
		var shoulderRT_hold = false;
			
		if (gamepad_is_connected(0)) {
			var threshold = (menu) ? GP_THRESHOLDT : GP_THRESHOLD;
			if (menu) {
				// Arrow inputs
				var dpadx = (gamepad_button_check_pressed(0, gp_padr) - gamepad_button_check_pressed(0, gp_padl));
				var dpady = (gamepad_button_check_pressed(0, gp_padd) - gamepad_button_check_pressed(0, gp_padu));
			} else {
				// Arrow inputs
				var dpadx = (gamepad_button_check(0, gp_padr) - gamepad_button_check(0, gp_padl));
				var dpady = (gamepad_button_check(0, gp_padd) - gamepad_button_check(0, gp_padu));
			}
			
			// Left stick inputs
			gp_axis_lx = (dpadx != 0) ? dpadx : gamepad_axis_value(0, gp_axislh);
			gp_axis_ly = (dpady != 0) ? dpady : gamepad_axis_value(0, gp_axislv);
			if (abs(gp_axis_lx) <= threshold) gp_axis_lx = 0;
			if (abs(gp_axis_ly) <= threshold) gp_axis_ly = 0;
			
			// Right stick inputs
			var gp_axis_rx_value = gamepad_axis_value(0, gp_axisrh);
			var gp_axis_ry_value = gamepad_axis_value(0, gp_axisrv);
			if (abs(gp_axis_rx_value) > GP_THRESHOLD) gp_axis_rx = gp_axis_rx_value;
			if (abs(gp_axis_ry_value) > GP_THRESHOLD) gp_axis_ry = gp_axis_ry_value;
			
			// Face pressed inputs
			var face1 = gamepad_button_check_pressed(0, gp_face1);
			var face2 = gamepad_button_check_pressed(0, gp_face2);
			var face3 = gamepad_button_check_pressed(0, gp_face3);
			var face4 = gamepad_button_check_pressed(0, gp_face4);
			
			// Face hold inputs
			var face1_hold = gamepad_button_check(0, gp_face1);
			var face2_hold = gamepad_button_check(0, gp_face2);
			var face3_hold = gamepad_button_check(0, gp_face3);
			var face4_hold = gamepad_button_check(0, gp_face4);
			
			// Shoulder pressed inputs
			var shoulderLB = gamepad_button_check_pressed(0, gp_shoulderl);
			var shoulderLT = gamepad_button_check_pressed(0, gp_shoulderlb);
			var shoulderRB = gamepad_button_check_pressed(0, gp_shoulderr);
			var shoulderRT = gamepad_button_check_pressed(0, gp_shoulderrb);
			
			// Shoulder hold inputs
			var shoulderLB_hold = gamepad_button_check(0, gp_shoulderl);
			var shoulderLT_hold = gamepad_button_check(0, gp_shoulderlb);
			var shoulderRB_hold = gamepad_button_check(0, gp_shoulderr);
			var shoulderRT_hold = gamepad_button_check(0, gp_shoulderrb);
			
			// Set old positions
			horizontall_old = (abs(gp_axis_lx));
			verticall_old = (abs(gp_axis_ly));
			
			horizontalr_old = (abs(gp_axis_rx));
			verticalr_old = (abs(gp_axis_ry));
		}
		
		
		if (menu) {
			// Final inputs
			up = ((keyboard_check_pressed(ord("W"))) or ((gp_axis_ly < 0) and (verticall_old == 0)));
			down = ((keyboard_check_pressed(ord("S"))) or ((gp_axis_ly > 0) and (verticall_old == 0)));
			left = ((keyboard_check_pressed(ord("A"))) or ((gp_axis_lx < 0) and (horizontall_old == 0)));
			right = ((keyboard_check_pressed(ord("D"))) or ((gp_axis_lx > 0) and (horizontall_old == 0)));
			
			accept = face1;
			cancel = face2;
		} else {
			// Final inputs
			up = (keyboard_check(ord("W")));
			down = (keyboard_check(ord("S")));
			left = (keyboard_check(ord("A")));
			right = (keyboard_check(ord("D")));
			
			// Set full speed if avobe threshold
			gp_axis_lx = (abs(gp_axis_lx) > GP_THRESHOLDT) ? sign(gp_axis_lx) : gp_axis_lx;
			gp_axis_ly = (abs(gp_axis_ly) > GP_THRESHOLDT) ? sign(gp_axis_ly) : gp_axis_ly;
			
			// Get the movement on x and y
			movex = (abs(right-left) > abs(gp_axis_lx)) ? (right-left) : gp_axis_lx;
			movey = (abs(down-up) > abs(gp_axis_ly)) ? (down-up) : gp_axis_ly;
			if (movex != 0) show_debug_message("movex"+string(movex));
			if (movey != 0) show_debug_message("movey"+string(movey));
		}
	}
	if (up) show_debug_message("up");
	if (down) show_debug_message("down");
	if (right) show_debug_message("right");
	if (left) show_debug_message("left");
}
