///@function draw_text_duo_color(x,y,char,text,col1,col2,alpha)
///@description Switch color text every time the string reads a special char
///@param {real} x
///@param {real} y
///@param {string} char
///@param {string} text
///@param {constant} col1
///@param {constant} col2
///@param {real} alpha
function draw_text_duo_color(_x,_y,_char,_text,_color1,_color2,_alpha) {
	//Set variable
	var cha = string_copy(_char,0,1);
	var clean_text = string_replace_all(_text,cha,"");
	var len = string_length(_text);
	var char_count = string_count(cha,_text);

	var text_part;
	var text_i = 0;
	var text_c;

	//Separate strings
	var actual_text="";
	for(var j = 1; j<=len; j++){
		var actual_char = string_char_at(_text,j);
	
		if(actual_char=cha){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}	else	{
			actual_text=string(actual_text)+string(actual_char);
		}
		if(j=len){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}
	}

	//Draw the text
	var ww = 0;
	switch(draw_get_halign()){
		case fa_left:
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_right:
			for(var i=char_count; i>=0; i--){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i<char_count)	ww -= string_width(text_part[i+1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_center:
			draw_set_halign(fa_left);
			var ll = string_width(clean_text)/2;
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x-ll+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
			draw_set_halign(fa_center);
		break;
	}

}

///@function draw_text_duo_glowing(x,y,char,text,color1,color2,alpha,glow_size,color_background)
///@description Switch color text every time the string reads a special char
///@param {real} x
///@param {real} y
///@param {string} char
///@param {string} text
///@param {constant} col1
///@param {constant} col2
///@param {real} alpha
///@param {real} glow_size
///@param {constant} color_background
function draw_text_duo_glowing(_x,_y,_char,_text,_color1,_color2,_alpha,_glow_size,_color_back) {

	//Set variables
	var d = 1/_glow_size;
	var cha = string_copy(_char,0,1);
	var clean_text = string_replace_all(_text,cha,"");
	var len = string_length(_text);
	var char_count = string_count(cha,_text);

	var text_part;
	var text_i = 0;
	var text_c;

	//Separate strings
	var actual_text="";
	for(var j = 1; j<=len; j++){
		var actual_char = string_char_at(_text,j);
		if(actual_char=cha){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}	else	{
			actual_text=string(actual_text)+string(actual_char);
		}
		if(j=len){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}
	}
	//Glowing
	for(var i = 1; i<=_glow_size; i++){
		var a = 1-(d*i);
		draw_text_color(_x,_y-i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x,_y+i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y-i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x+i,_y+i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y-i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
		draw_text_color(_x-i,_y+i,clean_text,_color_back,_color_back,_color_back,_color_back,a);
	}
	//Draw the text
	var ww = 0;
	switch(draw_get_halign()){
		case fa_left:
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_right:
			for(var i=char_count; i>=0; i--){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i<char_count)	ww -= string_width(text_part[i+1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_center:
			draw_set_halign(fa_left);
			var ll = string_width(clean_text)/2;
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x-ll+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
			draw_set_halign(fa_center);
		break;
	}
}

///@arg draw_text_duo_shadow(x,y,char,text,col1,col2,alpha,xoffset,yoffset,shadow_color,shadow_alpha)
///@description Switch color text every time the string reads a special char
///@param {real} x
///@param {real} y
///@param {string} char
///@param {string} text
///@param {constant} col1
///@param {constant} col2
///@param {real} alpha
///@param {real} xoffset
///@param {real} yoffset
///@param {constant} shadow_color
///@param {real} shadow_alpha
function draw_text_duo_shadow(_x,_y,_char,_text,_color1,_color2,_alpha,_xoffset,_yoffset,_shadow_color,_shadow_alpha) {

	//Set variables
	var cha = string_copy(_char,0,1);
	var clean_text = string_replace_all(_text,cha,"");
	var len = string_length(_text);
	var char_count = string_count(cha,_text);

	var text_part;
	var text_i = 0;

	//Separate strings
	var actual_text="";
	for(var j = 1; j<=len; j++){
		var actual_char = string_char_at(_text,j);
		if(actual_char=cha){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}	else	{
			actual_text=string(actual_text)+string(actual_char);
		}
		if(j=len){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}
	}
	//Shadow
	draw_text_color(_x+_xoffset,_y+_yoffset,clean_text,_shadow_color,_shadow_color,_shadow_color,_shadow_color,_shadow_alpha);

	//Draw the text
	var ww = 0;
	switch(draw_get_halign()){
		case fa_left:
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_right:
			for(var i=char_count; i>=0; i--){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i<char_count)	ww -= string_width(text_part[i+1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
		break;
		case fa_center:
			draw_set_halign(fa_left);
			var ll = string_width(clean_text)/2;
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x-ll+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha)
			}
			draw_set_halign(fa_center);
		break;
	}

}

///@function draw_text_duo_subtitle(x,y,char,text,col1,col2,alpha,padding,color_background,alpha_background)
///@description Switch color text every time the string reads a special char
///@param {real} x
///@param {real} y
///@param {string} char
///@param {string} text
///@param {constant} col1
///@param {constant} col2
///@param {real} alpha
///@param {real} padding
///@param {constant} color_background
///@param {real} alpha_background
function draw_text_duo_subtitle(_x,_y,_char,_text,_color1,_color2,_alpha,_padding,_color_back,_alpha_back) {

	//Set variables
	var cha = string_copy(_char,0,1);
	var clean_text = string_replace_all(_text,cha,"");
	var len = string_length(_text);
	var char_count = string_count(cha,_text);
	var v = draw_get_valign(); var a = draw_get_alpha();
	var width = string_width(clean_text)/2;
	var hh = string_height(clean_text)/2;

	var text_part;
	var text_i = 0;

	//Separate strings
	var actual_text="";
	for(var j = 1; j<=len; j++){
		var actual_char = string_char_at(_text,j);
		if(actual_char=cha){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}	else	{
			actual_text=string(actual_text)+string(actual_char);
		}
		if(j=len){
			text_part[text_i]=actual_text;
			text_i++;
			actual_text="";
		}
	}

	//Draw the text
	var ww = 0;
	switch(draw_get_halign()){
		case fa_left:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-_padding,_y-hh-_padding,_x+string_width(clean_text)+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha);
			}
		break;
		case fa_right:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-string_width(clean_text)-_padding,_y-hh-_padding,_x+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			for(var i=char_count; i>=0; i--){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i<char_count)	ww -= string_width(text_part[i+1]);	
				draw_text_color(_x+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha);
			}
		break;
		case fa_center:
			draw_set_valign(fa_middle);
			if(_alpha_back>0){
				draw_set_alpha(_alpha_back);
				draw_rectangle_color(_x-width-_padding,_y-hh-_padding,_x+width+_padding,_y+hh+_padding,_color_back,_color_back,_color_back,_color_back,false);
				draw_set_alpha(a);
			}
			draw_set_halign(fa_left);
			var ll = string_width(clean_text)/2;
			for(var i=0; i<=char_count; i++){
				var text_c = ( i mod 2=0 ? _color1 : _color2);
				if(i>0)	ww += string_width(text_part[i-1]);	
				draw_text_color(_x-ll+ww,_y,text_part[i],text_c,text_c,text_c,text_c,_alpha);
			}
			draw_set_halign(fa_center);
		break;
	}

	draw_set_valign(v);
}
