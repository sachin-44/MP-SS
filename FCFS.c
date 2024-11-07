
#include<stdio.h>

struct process{
    int id;
    int at;
    int bt;
    int tat,wt,ct;
}p[10];

void read(int n){
    printf("ID AT BT\n");
    for(int i=0;i<n;i++)
    {
        scanf("%d%d%d",&p[i].id,&p[i].at,&p[i].bt);
    }
}

void FCFS(int n)
{
    float tbt=0,twt=0,ttat=0;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n-i-1;j++)
        {
            if(p[j].at>p[j+1].at)
            {
                struct process p1=p[j];
                p[j]=p[j+1];
                p[j+1]=p1;
            }
        }
    }
    p[0].wt=0;
    p[0].ct=p[0].bt+p[0].at;
    p[0].tat=p[0].bt;
    tbt=p[0].bt;
    twt=p[0].wt;
    ttat=p[0].tat;
    for(int i=1;i<n;i++)
    {
        if(p[i-1].ct>p[i].at){
            p[i].wt=tbt-p[i].at;
            p[i].ct=p[i].bt+p[i].at+p[i].wt;
            p[i].tat=p[i].bt+p[i].wt;
            tbt+=p[i].bt;
            twt+=p[i].wt;
            ttat+=p[i].tat;
        }
        else{
            p[i].wt=0;
            p[i].ct=p[i].at+p[i].bt;
            p[i].tat=p[i].wt+p[i].bt;
            tbt+=p[i].bt+(p[i].at-p[i-1].ct);
            ttat+=p[i].tat;
            twt+=p[i].wt;
        }
    }
    printf("Avg WT :%f\n",(twt/n));
    printf("Avg TAT :%f\n",(ttat/n));
    
}
int main()
{
    int n;
    printf("Enter the no. of process: ");
    scanf("%d",&n);
    read(n);
    FCFS(n);
    printf("ID\tAT\tBT\tCT\tTAT\tWT\n");
    for(int i=0;i<n;i++)
    {
        printf("%d\t%d\t%d\t%d\t%d\t%d\n",p[i].id,p[i].at,p[i].bt,p[i].ct,p[i].tat,p[i].wt);
    }
}
