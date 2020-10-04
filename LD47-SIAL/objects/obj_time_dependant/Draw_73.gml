/// @descriptionDraw selected overlay

if (selected) {
	var color = (invalid) ? red : yellow;
	draw_sprite_ext(asset_get_index(sprite_get_name(sprite_index)+"_selected"), image_index, x, y, DRAW_SCALE, DRAW_SCALE, 0, color, 1);
}
