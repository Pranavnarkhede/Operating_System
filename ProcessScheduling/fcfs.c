#include<stdio.h>


struct Data{

int procNo;
int Bt;
int At;
int Tat;
int Wt;
int Ct;
};

void sort(struct Data process[],int num);
void calculation(struct Data process[],int num);

int main(){
 
 int num;
 printf("\nENter the number of process==>");
 scanf("%d",&num);
 struct Data process[num];
 for(int i=0;i<num;i++)
     {
    printf("Enter the processNumber==>");
    scanf("%d",&process[i].procNo);
    printf("Enter Arrival time==>");
    scanf("%d",&process[i].At);
             printf("Enter Burst time==>");
             scanf("%d",&process[i].Bt);
     }
printf("ProcessNo\t AT\t\t BT\n");
for(int i=0;i<num;i++){
  printf("%d\t\t : %d\t\t : %d\t\t \n",process[i].procNo,process[i].At,process[i].Bt);

}
sort(process,num);
printf("ProcessNo\t AT\t\t BT\n");
for(int i=0;i<num;i++){
  printf("%d\t\t : %d\t\t : %d\t\t \n",process[i].procNo,process[i].At,process[i].Bt);

}
calculation(process,num);


 return 0;

}



void sort(struct Data process[],int num){

  for(int i=0;i<num-1;i++){
 for(int j=i;j<num-1;j++){
 if(process[i].At > process[j+1].At){
 int temp=process[i].At;
 process[i].At=process[j+1].At;
 process[j+1].At=temp;

 temp=process[i].Bt;
                          process[i].Bt=process[j+1].Bt;
                          process[j+1].Bt=temp;

 temp=process[i].procNo;
                          process[i].procNo=process[j+1].procNo;
                          process[j+1].procNo=temp;
}
          }
}
}  
void calculation(struct Data process[],int n){

int currTime=0;
     
     for(int i=0;i<n;i++)
     {
        while(currTime < process[i].At)
        {
           currTime++;
        }
        process[i].Ct = currTime + process[i].Bt;
        process[i].Tat = process[i].Ct-process[i].At;
        process[i].Wt= process[i].Tat-process[i].Bt;
        currTime=process[i].Ct;
         
     }
     
     float sumTT=0,sumWT=0;
     
     for(int i=0;i<n;i++)
     {
         sumTT+=process[i].Tat;
         sumWT+=process[i].Wt;
     }
     
     
     printf("P\t: AT\t: BT\t: CT\t: TT\t: WT\t\n");
     
     for(int i=0;i<n;i++)
     {
    printf("P%d\t : %d\t : %d\t : %d\t : %d\t  : %d\t\n",process[i].procNo,process[i].At,process[i].Bt,process[i].Ct,process[i].Tat,process[i].Wt);
     }
     
     printf("Average TT = %f\n",sumTT/n);
     printf("Average WT = %f\n",sumWT/n);
     
}
