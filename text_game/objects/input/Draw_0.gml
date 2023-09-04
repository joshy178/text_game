/// @description Insert description here
// You can write your code in this editor




var _temp_text = text_input;
if( blink and string_length(_temp_text) > 0 ){
	_temp_text = string_set_byte_at(_temp_text, cursor_index, 95);
}
draw_text(x, y,_temp_text);
