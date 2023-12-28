shader_type canvas_item;
uniform float fade_speed;
uniform vec2 exclude_tile_coordinates;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 current_tile_coordinates = FRAGCOORD.xy;

    if (current_tile_coordinates != exclude_tile_coordinates) {
        if (COLOR.a > 0.0)
			COLOR.a *= 1.0 - (TIME * fade_speed);
    }
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
