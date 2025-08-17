function load_default_keys(){
	//Ação
	global.key_A = ord("Z");
	global.key_B = ord("X");
	global.key_start = vk_enter;
	global.key_select = vk_shift;
	//Direcionais
	global.key_left = vk_left;
	global.key_right = vk_right;
	global.key_up = vk_up;
	global.key_down = vk_down;
}

function controls(){
	//Ação
	key_A  = keyboard_check_pressed(global.key_A);
	key_B = keyboard_check_pressed(global.key_B);
	holdkey_B = keyboard_check(global.key_B);
	key_start=keyboard_check_pressed(global.key_start);
	key_select=keyboard_check_pressed(global.key_select);
	//Direcionais
	key_up = keyboard_check(global.key_up);
	key_down=keyboard_check(global.key_down);
	key_left=keyboard_check(global.key_left);
	key_right=keyboard_check(global.key_right);
}