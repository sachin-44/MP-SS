
#include<stdio.h> 
struct Process{ 
    int id,bt,wt,at,tat,tbt; 
}; 
int main(){ 
    int n,tq; 
    int x=0; //0th time 
    int y=0; //0 Processes Completed 
    int i=0; //ith Process 
    printf("Enter the Number of Processes:\t"); 
    scanf("%d",&n); 
    struct Process P[n]; 
    printf("Enter the Time Quantum:\t"); 
    scanf("%d",&tq); 
    printf("Enter the ID, ARRIVAL TIME, BURST TIME of each process:\n"); 
    for(int j=0;j<n;j++){ 
        printf("Process %d:\n",j+1); 
        scanf("%d%d%d",&P[j].id,&P[j].at,&P[j].bt); 
        P[j].tbt=P[j].bt; 
    } 
    for(int j=0;j<n-1;j++){ 
        for(int k=0;k<n-i-1;k++){ 
            if(P[k].at>P[k+1].at){ 
                struct Process temp=P[k]; 
                P[k]=P[k+1]; 
                P[k+1]=temp; 
            } 
        } 
    } 
    while(1){ 
        if(P[i].bt>0){ 
            if(P[i].bt>tq){ 
                P[i].bt-=tq; 
                x+=tq; 
            } 
            else{ 
                x+=P[i].bt; 
                P[i].bt=0; 
 
                P[i].tat=x-P[i].at; 
                P[i].wt=P[i].tat-P[i].tbt; 
 
                y++; 
                if(y==n) 
                break; 
} 
} 
if(i==n-1) 
i=0; 
else if(P[i+1].at<=x) 
i++; 
else 
i=0; 
} 
int ttat=0,twt=0; 
for(int j=0;j<n;j++){ 
ttat+=P[j].tat; 
twt+=P[j].wt; 
} 
float avg_tat=(float)ttat/n; 
float avg_wt=(float)twt/n; 
printf("\nID\tBT\tWT\tTAT\n"); 
for(int j=0;j<n;j++){ 
printf("%d\t%d\t%d\t%d\n",P[j].id,P[j].tbt,P[j].wt,P[j].tat); 
} 
printf("\nAverage Waiting Time: %.1f",avg_wt); 
printf("\nAverage Turn Around Time: %.1f",avg_tat); 
} 
