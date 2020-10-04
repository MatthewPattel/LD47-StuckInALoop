// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_wave(from, to, duration, offset) {
	a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function probability(percentage) {
	return (percentage > random(100));
}

function value_between(val, n1, n2) {
	var nmin = min(n1, n2);
	var nmax = max(n1, n2);
	
	return ((val >= nmin) and (val <= nmax));
}

///draw_text_colour_outline(x, y, string, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle);
//By Blokatt - @blokatt, blokatt.net
function draw_text_color_outline(xx, yy, str, textColor, textAlpha, outlineColor, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle) {
	/*
	var i;
	for (i = 0; i < 360; i += 360 / outlineQuality){
	    draw_text_transformed_color(xx + lengthdir_x(outlineThickness, i), yy + lengthdir_y(outlineThickness, i), string(str), xscale, yscale, angle, outlineColor, outlineColor, outlineColor, outlineColor, outlineAlpha);
	}
	draw_text_transformed_color(xx, yy, string(str), xscale, yscale, angle, textColor, textColor, textColor, textColor, textAlpha);
	*/
	
	draw_text_glowing(xx, yy, str, textColor, 1, 2, outlineColor);
}

function draw_gui_sprite(sprite, inverted, xx, yy, sscale, color, alpha, gdetail, gcolor) {
	
	var xscale = (inverted) ? sscale*-1 : sscale;
	var c = (color) ? color : c_white;
	var a = (alpha) ? alpha : 1;
	
	if (!is_undefined(gdetail)) {
		draw_sprite_glowing(sprite, 2, xx, yy, xscale, sscale, 0, c, a, gdetail, gcolor);
	}
	
	draw_sprite_ext(sprite, 0, xx, yy, xscale, sscale, 0, c_white, a);
	draw_sprite_ext(sprite, 1, xx, yy, xscale, sscale, 0, c, a);
}


function collision_line_point(x1, y1, x2, y2, obj, prec, notme) {
	var rr = collision_line(x1, y1, x2, y2, obj, prec, notme);
	var rx = x2;
	var ry = y2;
	if (rr != noone) {
	    var p0 = 0;
	    var p1 = 1;
	    repeat (ceil(log2(point_distance(x1, y1, x2, y2))) + 1) {
	        var np = p0 + (p1 - p0) * 0.5;
	        var nx = x1 + (x2 - x1) * np;
	        var ny = y1 + (y2 - y1) * np;
	        var px = x1 + (x2 - x1) * p0;
	        var py = y1 + (y2 - y1) * p0;
	        var nr = collision_line(px, py, nx, ny, obj, prec, notme);
	        if (nr != noone) {
	            rr = nr;
	            rx = nx;
	            ry = ny;
	            p1 = np;
	        } else p0 = np;
	    }
	}
	var r;
	r[0] = rr;
	r[1] = rx;
	r[2] = ry;
	return r;
}