// Diminui 1 segundo
if (global.time > 0) {
    global.time -= 1;
    alarm[0] = room_speed; // reinicia o alarme
} else {
    // Tempo acabou → jogador perde vida ou game over
    show_debug_message("TIME UP!");
    // aqui você pode chamar sua função de morte ou fim de jogo
}
