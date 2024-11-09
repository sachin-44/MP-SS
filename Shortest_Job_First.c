#include<stdio.h>

struct process {
    int id, bt;
    int ct, wt, tat;
} array[10];

void read(int n) {
    for (int i = 0; i < n; i++) {
        printf("ID  BT:");
        scanf("%d%d", &array[i].id,  &array[i].bt);
    }
}

void sort(int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (array[j].bt > array[j + 1].bt) {
                struct process p = array[j];
                array[j] = array[j + 1];
                array[j + 1] = p;
            }
        }
    }
}

void SJF(int n) {
    int total_wt = 0, total_tat = 0,total_bt=0;
    array[0].wt = 0;
    array[0].ct =array[0].bt;
    array[0].tat = array[0].bt + array[0].wt;
    total_wt += array[0].wt;
    total_bt+=array[0].bt;
    total_tat += array[0].tat;
    for (int i = 1; i < n; i++) {
        		array[i].wt=total_bt;
			array[i].ct=array[i].wt+array[i].bt;
			array[i].tat=array[i].wt+array[i].bt;
			total_wt+=array[i].wt;
			total_tat+=array[i].tat;
			total_bt+=array[i].bt;
    }

    float avg_tat = (float) total_tat / n;
    float avg_wt = (float) total_wt / n;
    printf("Average WT : %f\n", avg_wt);
    printf("Average TAT : %f\n", avg_tat);
}

int main() {
    int n;
    printf("Enter the number of processes: \n");
    scanf("%d", &n);
    read(n);
    sort(n);
    SJF(n);
    printf("ID\tBT\tCT\tTAT\tWT\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t%d\n", array[i].id, array[i].bt, array[i].ct, array[i].tat,
               array[i].wt);
    }
}

