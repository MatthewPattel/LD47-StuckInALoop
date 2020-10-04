/// @description Active old

active_old = active;

if (invalid) {
	if (alarm[0] == -1) alarm[0] = room_speed/2;
}

if (selected) {
	var inst_near = collision_line_point(obj_player.x, obj_player.y, obj_target.x, obj_target.y, object_index, false, false);
	if (inst_near[0] != id) selected = false;
}
