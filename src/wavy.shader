shader_type canvas_item;

void vertex() {
	VERTEX.y += sin(TIME*2.0 + VERTEX.x)*6.0 + cos(TIME + VERTEX.x)*5.0;
}