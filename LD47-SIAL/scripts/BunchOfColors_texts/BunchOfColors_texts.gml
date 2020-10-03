///@function draw_text_col(x,y,text,color,alpha)
///@description Reduces the amount of arguments of draw_text_color
///@param {real} x
///@param {real} y
///@param {string} text
///@param {constant} color
///@param {real} alpha
function draw_text_col(_x,_y,_text,_color,_alpha) {
	draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
}

///@function draw_text_glowing(x,y,text,color,alpha,glow_size,color_background)
///@param {real} x
///@param {real} y
///@param {string} text
///@param {constant} color
///@param {real} alpha
///@param {real} glow_size
///@param {constant} color_background
function draw_text_glowing(_x,_y,_text,_color,_alpha,_glow_size,_color_back) {

	var d = 1/_glow_size;
	for(var i = 1; i<=_glow_size; i++){
		var a = 1-(d*i);
		draw_text_color(_x,_y-i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x,_y+i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y-i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y+i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y-i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y+i,string(_text),_color_back,_color_back,_color_back,_color_back,a);
	}
	draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
}
	

///@function draw_text_shadow(x,y,text,color,alpha,xoffset,yoffset,shadow_color,shadow_alpha)
///@param {real} x
///@param {real} y
///@param {string} text
///@param {constant} color
///@param {real} alpha
///@param {real} xoffset
///@param {real} yoffset
///@param {constant} shadow_color
///@param {real} shadow_alpha
function draw_text_shadow(_x,_y,_text,_color,_alpha,_xoffset,_yoffset,_shadow_col,_shadow_alpha) {
	draw_text_color(_x+_xoffset,_y+_yoffset,string(_text),_shadow_col,_shadow_col,_shadow_col,_shadow_col,_shadow_alpha);
	draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
}

///@function draw_text_subtitle(x,y,text,color,alpha,padding,color_background,alpha_background)
///@param {real} x
///@param {real} y
///@param {string} text
///@param {constant} color
///@param {real} alpha
///@param {real} padding
///@param {constant} color_background
///@param {real} alpha_background
function draw_text_subtitle(_x,_y,_text,_color,_alpha,_padding,_color_back,_alpha_back) {

	var ww = string_width(_text)/2;
	var hh = string_height(_text)/2;
	var v = draw_get_valign(); var a = draw_get_alpha();

	switch(draw_get_halign()){
		case fa_center:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-ww-_padding,_y-hh-_padding,_x+ww+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
		break;
		case fa_left:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-_padding,_y-hh-_padding,_x+string_width(_text)+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
		break;
		case fa_right:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-string_width(_text)-_padding,_y-hh-_padding,_x+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			draw_text_color(_x,_y,string(_text),_color,_color,_color,_color,_alpha);
		break;
	}

	draw_set_valign(v);


}
