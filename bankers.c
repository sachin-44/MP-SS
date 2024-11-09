
#include<stdio.h> 
int alloc[10][10],max[10][10],need[10][10]; 
int avail[10]; 
int p,r; 
void read(int mat[10][10]) 
{ 
    for(int i=0;i<p;i++) 
    for(int j=0;j<r;j++) 
    scanf("%d",&mat[i][j]); 
} 
void display(int mat[10][10]) 
{ 
    for(int i=0;i<p;i++){ 
        for(int j=0;j<r;j++){ 
            printf("%d\t",mat[i][j]); 
        } 
        printf("\n"); 
    } 
} 
void bankers() 
{ 
    int finish[10]={0},seq[10]; 
    int i,j,index=0,flag; 
    for(i=0;i<p;i++) 
    { 
        flag=0; 
        if(finish[i]==0) 
        { 
            for(j=0;j<r;j++) 
            { 
                if(need[i][j]>avail[j]) 
                { 
                    flag=1; 
                    break; 
                } 
            } 
            if(flag==0) 
            { 
                finish[i]=1; 
                seq[index++]=i; 
                for(j=0;j<r;j++) 
                { 
                    avail[j]+=alloc[i][j]; 
                } 
                i=-1; 
            } 
        } 
    } 
    flag=0; 
    for(i=0;i<p;i++) 
    { 
        if(finish[i]==0) 
        { 
            flag=1; 
            printf("\nUnsafe State."); 
            break; 
        } 
    } 
    if(flag==0) 
    { 
        printf("\nSafe state:\nSafe Sequence:\t"); 
        for(i=0;i<p;i++) 
        { 
            printf("P%d",seq[i]); 
            if(i<p-1) 
            { 
                printf("-->"); 
            } 
        } 
    } 
} 
int main() 
{ 
    printf("Enter the Number of Processes and Resources:\n"); 
    scanf("%d%d",&p,&r); 
    printf("\nEnter the Allocation Matrix:\n"); 
    read(alloc); 
    printf("\nEnter the Max Matrix:\n"); 
    read(max); 
    for(int i=0;i<p;i++){ 
        for(int j=0;j<r;j++){ 
            need[i][j]=max[i][j]-alloc[i][j]; 
        } 
    } 
    printf("\nEnter the Available Resources:\n"); 
    for(int i=0;i<r;i++){ 
        scanf("%d",&avail[i]); 
    } 
    printf("\nAllocation Matrix:\n"); 
    display(alloc); 
    printf("\nMax Matrix:\n"); 
    display(max); 
    printf("\nNeed Matrix:\n"); 
display(need); 
bankers(); 
} 
