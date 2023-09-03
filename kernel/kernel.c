#define VIDEO_MEMORY 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80

void clearScreen(char character, int color){
	unsigned short* video_memory = (unsigned short*) VIDEO_MEMORY;	
	int i = 0;

	while(i <= (MAX_COLS * MAX_ROWS) + 2){
		video_memory[i] = (int)character;
		video_memory[i+1] = color;
		i++;
	}

}

int main(){
	int color = 0xEE;
	char character = ' ';
	clearScreen(character, color);
	while(1);
}


