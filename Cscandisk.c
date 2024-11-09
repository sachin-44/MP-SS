#include <stdio.h>
#include <stdlib.h>

int main() {
    int r, re[10], sp, ds, thm = 0, num = 0;

    printf("Enter the Number of Requests:\t");
    scanf("%d", &r);

    printf("Enter the Request Sequence:\n");
    for (int i = 0; i < r; i++) {
        scanf("%d", &re[i]);
    }

    printf("Enter the Starting Point:\t");
    scanf("%d", &sp);

    printf("Enter the Disk Size:\t");
    scanf("%d", &ds);

    // Sort request sequence (optional, for better understanding)
    for (int i = 0; i < r - 1; i++) {
        for (int j = 0; j < r - i - 1; j++) {
            if (re[j] > re[j + 1]) {
                int temp = re[j];
                re[j] = re[j + 1];
                re[j + 1] = temp;
            }
        }
    }

    // Find the nearest request in the opposite direction
    for (int i = 0; i < r; i++) {
        if (re[i] < sp) {
            num = re[i];
        }
    }

    // Calculate total head movements in CSCAN
    thm += (ds - 1 - sp) + (ds - 1) + (num - 0);

    printf("Total Head Movements in CSCAN: %d\n", thm);

    return 0;
}
