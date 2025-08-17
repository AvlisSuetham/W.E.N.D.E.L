function player_start(){
	//Controles
	load_default_keys();
	controls();
	//Variáveis da Fisica
	spd = 2;
	min_spd = 2;
	max_spd = 2.6;
	hspd = 0;
	vspd = 0;
	grv = 0.4;
	jump = false;
	just_landed = false;
}

function player_moveset() {
    var move = key_right - key_left;
    hspd = move * spd;
    vspd += grv;

    // Troca de lado da sprite
    if (hspd != 0) image_xscale = sign(hspd);

    // --- Colisão Horizontal ---
    if (place_meeting(x+hspd, y, obj_solid)) {
        while (!place_meeting(x + sign(hspd), y, obj_solid)) {
            x += sign(hspd);
        }
        hspd = 0;
    }
    x += hspd;

    // --- Colisão Vertical ---
    if (place_meeting(x, y+vspd, obj_solid)) {
        while (!place_meeting(x, y + sign(vspd), obj_solid)) {
            y += sign(vspd);
        }
        // Se estava no ar e agora tocou o chão
        if (jump) {
            just_landed = true; // marca aterrissagem
        }
        vspd = 0;
        jump = false;
    } else {
        jump = true; // Está no ar
    }
    y += vspd;

    // --- Pular ---
    if (place_meeting(x, y+1, obj_solid) && key_A) {
		image_index = 0;
        jump = true;
        if (spd >= max_spd) vspd = -7.5;
        else vspd = -6.5;
		audio_play_sound(snd_jump,1,false);
    }

    // --- Corrida ---
    if (holdkey_B) {
        if (spd != max_spd) spd += 0.05;
    } else {
        if (spd != min_spd) spd -= 0.25;
    }
    if (spd < min_spd) spd = min_spd;

    // Gravidade ajustada
    if (spd >= max_spd) grv = 0.32;
    else grv = 0.35;
}

function player_img() {
    var move = key_right - key_left;

    // --- Momento da aterrissagem ---
    if (just_landed) {
        sprite_index = spr_player_place;
        just_landed = false; // reseta a flag
    }
    // --- No ar: sprite de pulo ---
    else if (jump) {
        if (vspd < 0) sprite_index = spr_player_jump_up;
        else sprite_index = spr_player_jump_down;
    } 
    // --- Movendo-se no chão ---
    else if (move != 0) {
        if (spd >= max_spd) sprite_index = spr_player_run;
        else sprite_index = spr_player_walk;
    } 
    // --- Parado ---
    else {
        sprite_index = spr_player_idle;
    }
}