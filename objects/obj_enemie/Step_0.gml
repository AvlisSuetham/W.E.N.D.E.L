// Pega posição e tamanho da view 0
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
var vw = camera_get_view_width(view_camera[0]);
var vh = camera_get_view_height(view_camera[0]);

// Margem (raio de funcionamento)
var margem = 64;

// Verifica se o inimigo está dentro da view + margem
if (x > vx - margem && x < vx + vw + margem &&
    y > vy - margem && y < vy + vh + margem) {
    
    if (alive) {
        // Checar borda
        if (piso_ia) {
            if (!place_meeting(x + dir * spd, y + 1, obj_solid)) {
                dir *= -1;
                image_xscale = dir;
            }
        }

        // Checar parede
        if (place_meeting(x + dir * spd, y, obj_solid)) {
            dir *= -1;
            image_xscale = dir;
        } else {
            x += dir * spd;
        }

        // Gravidade
        if (!place_meeting(x, y + 1, obj_solid)) {
            y += 4;
        }
    }
}

//Morte
if (!alive) {
    y += 2; // cai um pouco ou animação de morte
    if (y > room_height + 32) { // fora da tela
        instance_destroy();
    }
}
