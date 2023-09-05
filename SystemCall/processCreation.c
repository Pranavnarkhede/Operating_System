#include<stdio.h>
#include<sys/types.h>
#include<ctype.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>

void asc(int*,int);
void dsc(int*,int);

int main(){

int *a,n,i;
pid_t pid;
printf("\nEnter the no of Array Elements==>");
scanf("%d",&n);
a=(int*)malloc(n*sizeof(int));
printf("\nEnter the array Elements==>");

for(int i=0;i<n;i++){
 printf("\na[%d]==>",i);
 scanf("%d",&a[i]);

}
printf("\n");
pid=fork();

if(pid < 0){
	perror("Fork Error\n");
}
else if(pid == 0){
   printf("Child Process is Created with id==>%ld",(long)getpid());
}
else{
	printf("Parent Process id==>%ld",(long)getpid());
}


switch(pid){

 	case -1:
		printf("\n ERROR \n");
		exit(-1);
	case 0:
		printf("Child Process Executes\n");
		asc(a,n);
		exit(0);
	default:
		printf("Parent Executes\n");
		dsc(a,n);
		system("ps -elf");
		exit(pid);
}


void asc(int *a,int n){
	int i,j,temp;
	for(i=0;i<n;i++){
		for(j=i+1;j<n;j++){
			if (a[i]>a[j]){
				temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
	}
	printf("Array in ascending order is :\n");
	for(i=0;i<n;i++)
		printf("%d ",a[i]);
	printf("\n");
}


void dsc(int *a,int n){
	int i,j,temp;
	for(i=0;i<n;i++){
		for(j=i+1;j<n;j++){
			if(a[j]>a[i])
			{
				temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
	}

	printf("Array in descending order is :)\n");
	for(i=0;i<n;i++)
		printf("%d ",a[i]);
	printf("\n");
 }

}
