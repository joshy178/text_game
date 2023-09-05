/// @description Insert description here
// You can write your code in this editor




var _temp_text = text_input;
if( blink ){
	if( cursor_index > string_length(_temp_text) ){
		_temp_text = _temp_text + "_"	
	}
	else{
		_temp_text = string_set_byte_at(_temp_text, cursor_index, 95);
	}
}
_temp_text += "\nCursor index: " + string(cursor_index) + "\n len: " + string(string_length(text_input))
draw_set_font(ConsoleFont);
draw_set_colour(c_green)
//draw_text_color(x, y,_temp_text, c_green, c_green, c_green, c_green, 1);
draw_text_transformed(x, y, _temp_text, 1, 1, 0); // this will draw at 64 pixels tall