/// @description Insert description here
// You can write your code in this editor


#macro CURSOR_BLINK_TIME (50 * 10000)
#macro BACKSPACE_POLL_TIME (50 * 10000)
#macro BACKSPACE_DELETE_SPEED_TIME (5 * 10000)




var _temp = keyboard_string
var _temp_char = keyboard_lastchar
var _temp_char_2 = keyboard_key

keyboard_string = ""
keyboard_lastchar = ""
keyboard_key = 0

if( (get_timer() - last_blink ) > CURSOR_BLINK_TIME ){
	last_blink = get_timer();
	blink = !blink;
}




if( keyboard_check_pressed(vk_left)){
	cursor_index--;
	if( cursor_index < 1){
		cursor_index = 1;	
	}
	last_blink = get_timer();
	blink = true;
	
	last_left_check = get_timer();

}
else if(keyboard_check_direct(vk_left)
		and ( (get_timer() - last_left_check ) > BACKSPACE_POLL_TIME )
		and ( (get_timer() - last_left ) > BACKSPACE_DELETE_SPEED_TIME )

){
		cursor_index--;
	if( cursor_index < 1){
		cursor_index = 1;	
	}
	_temp = "";
	last_left = get_timer();
	last_blink = get_timer();
	blink = true;

	}
else if( keyboard_check_pressed(vk_right)){
	cursor_index++;	
	if( cursor_index > string_length(text_input) + 1){
		cursor_index = string_length(text_input) + 1;	
	}	
	last_blink = get_timer();
	blink = true;
}


else if(keyboard_check_released(vk_left)){ _temp = ""; }

else if(keyboard_check_direct(vk_right)){ _temp = ""; }
else if(keyboard_check_released(vk_right)){ _temp = ""; }


// if the backspace is pressed, then do the first character delete,
// then wait a little bit before we delete more
else if( keyboard_check_pressed (vk_backspace) ){
	if(string_length(text_input) > 0 and cursor_index > 1){
		text_input = string_delete(text_input, cursor_index-1, 1);
		cursor_index--
		if( cursor_index < 1){
			cursor_index = 1;	
		}
	}
	last_backspace_check = get_timer();
}
//if enough time has passed before we have hit the backspace key
//and we haven't delete a character in a little bit
//and we are still holding down backspace
else if( ( (get_timer() - last_backspace_check ) > BACKSPACE_POLL_TIME )
		and  ( (get_timer() - last_backspace_delete ) > BACKSPACE_DELETE_SPEED_TIME )
		and keyboard_check_direct(vk_backspace) ){
	//reset the last delete time
	last_backspace_delete = get_timer();
	//delete a character
	if(string_length(text_input) > 0 and cursor_index > 1){
		text_input = string_delete(text_input, cursor_index-1, 1);
		cursor_index--
		if( cursor_index <1){
			cursor_index = 1;
		}
	}

}
else{

	
	if (string_count(chr(_temp_char_2), enabled_keys)) and (string_length(chr(_temp_char_2)) == 1){
		text_input = string_insert(_temp_char, text_input, cursor_index);
		cursor_index += string_length(_temp_char)
		if( cursor_index > string_length(text_input)+ 1){
			cursor_index = string_length(text_input)+ 1;	
		}
	}
}




