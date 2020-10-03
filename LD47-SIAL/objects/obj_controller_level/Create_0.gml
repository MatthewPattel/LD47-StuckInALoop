/// @description Creation variables

level = real(string_delete(room_get_name(room), 1, 9));

show_debug_message("level "+string(level));
