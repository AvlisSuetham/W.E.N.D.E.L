if (other.vspd > 0 && other.y + other.vspd < y) {
    // jogador está caindo sobre o inimigo
    alive = false;
	audio_play_sound(snd_enemie_death,1,false);
    //sprite_index = spr_enemy_dead;
	image_alpha = 0.5;

    // faz o jogador quicar
    other.vspd = -4;
} else {
	instance_destroy(other);
}
