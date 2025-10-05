#include<stdio.h>
#include<string.h>
#include<ctype.h>
void analyze(const char* code){
char buffer[1000];
int i =0;
int j =0;
while(code[i]!='\0'){
	char ch = code[i];
	if(ch ==' ' || ch == '\n' || ch == '\t' ){
		i++;
		continue;
	}
	else if(isalpha(ch)){
		char keywords[3][100]={"int","char","float"};
		int j =0;
		int isKeyword =0;
		while(isalnum(code[i])){
			buffer[j++]= code[i++];
		}
		for(int k =0;k<3;k++){
		if(strcmp(buffer,keywords[k])==0){
			printf("KEYWORD : %s\n",buffer);
			isKeyword = 1;
			}
		}
		if(!isKeyword){
			buffer[j]='\0';
		printf("IDENTIFIER : %s\n",buffer);
	
		}
	}
	else if (isdigit(ch)){
		j = 0;
		while(isdigit(code[i])){
			buffer[j++]= code[i++];
		}
		buffer[j]='\0';
		printf("NUMBER : %s\n",buffer);
	}
	else{
	printf("SYMBOL: : %c\n",ch);
	i++;
	}
}
}

int main(){
int i= 0;
char ch ;
char input[1000];
printf("Enter the input (end with $) : ");
while((ch = getchar())!='$'){
	input[i++]= ch;
}
input[i]= '\0';
printf("---------------Tokens : -------------\n");
analyze(input);
return 0;
}
