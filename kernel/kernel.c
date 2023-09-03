void printA(char* str){
	char* video_memory = (char*) 0xb8000;
	str--;
	video_memory[3] = str;	
	//*video_memory = 'A';
}

void main(){
	int x = 2*4;
  char* video_memory = (char*) 0xb8000;
  *video_memory = (char)(48 + x);
  printA('Hell');
  *video_memory = 'B';
  printA('Hell');
	// video_memory += 2;
	// *video_memory = 'a';
//	*video_memory = (char)49;
	while(1);
}


