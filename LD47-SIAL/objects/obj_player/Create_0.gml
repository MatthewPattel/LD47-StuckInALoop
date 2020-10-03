/// @description Creation variables

input = new inputGame();

targetInputMouse = true;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

hsp = 0;
hsp_final = 0;
hsp_f = 0;

vsp = 0;
vsp_final = 0;
vsp_f = 0;

targetDistance = CELL_SIZE*4;
targetDirection = point_direction(x, y, x+1, y+1);

targetx = lengthdir_x(targetDistance, targetDirection);
targety = lengthdir_y(targetDistance, targetDirection);
