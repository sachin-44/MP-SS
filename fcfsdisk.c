#include<stdio.h>
#include<stdlib.h>

int requests[100];

void FCFS(int n, int head)
{
    int seek = 0;
    for(int i = 0; i < n; i++)
    {
        seek += abs(head - requests[i]);
        head = requests[i];
    }
    printf("FCFS Total Seek Time: %d\n", seek);
}

int main()
{
    int n, head;
    printf("Enter the number of disk requests: ");
    scanf("%d", &n);
    printf("Enter the requests: ");
    for(int i = 0; i < n; i++)
    {
        scanf("%d", &requests[i]);
    }
    printf("Enter the initial head position: ");
    scanf("%d", &head);

    FCFS(n, head);

    return 0;
}
