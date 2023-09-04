/// @description Insert description here
// You can write your code in this editor


#macro CURSOR_BLINK_TIME (50 * 10000)
#macro BACKSPACE_POLL_TIME (25 * 10000)
#macro BACKSPACE_DELETE_SPEED_TIME (5 * 10000)


if( (get_timer() - last_blink ) > CURSOR_BLINK_TIME ){
	last_blink = get_timer();
	blink = !blink;
}




if( keyboard_check_pressed(vk_left)){
	cursor_index--;
	if( cursor_index < 1){
		cursor_index = 1;	
	}

}
else if( keyboard_check_pressed(vk_right)){
	cursor_index++;	
	if( cursor_index > string_length(text_input)){
		cursor_index = string_length(text_input);	
	}	
}

// if the backspace is pressed, then do the first character delete,
// then wait a little bit before we delete more
else if( keyboard_check_pressed (vk_backspace) ){
	text_input = string_delete(text_input, string_length(text_input), 1);	
	last_backspace_check = get_timer();
}
//if enough time has passed before we have hit the backspace key
//and we haven't delete a character in a little bit
//and we are still holding down backspace
else if( ( (get_timer() - last_backspace_check ) > CURSOR_BLINK_TIME )
		and  ( (get_timer() - last_backspace_delete ) > BACKSPACE_DELETE_SPEED_TIME )
		and keyboard_check_direct(vk_backspace) ){
	//reset the last delete time
	last_backspace_delete = get_timer();
	//delete a character
	text_input = string_delete(text_input, string_length(text_input), cursor_index);
}
else{
	text_input += keyboard_string
}

keyboard_string = ""



