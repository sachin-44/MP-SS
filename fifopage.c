#include <stdio.h>

int main() {
    int n, rs[30], f, pf = 0, m[10], count = 0;
    
    printf("\nEnter the length of page string: ");
    scanf("%d", &n);
    
    printf("Enter the reference page string: ");
    for (int i = 0; i < n; i++) {
        scanf("%d", &rs[i]);
    }
    
    printf("Enter the number of frames: ");
    scanf("%d", &f);
    
    for (int i = 0; i < f; i++) {
        m[i] = -1; // initializing all frames with -1
    }
    
    for (int i = 0; i < n; i++) {
        int k;
        for (k = 0; k < f; k++) {
            if (m[k] == rs[i]) { // checking for hit
                break;
            }
        }
        
        if (k == f) { // condition for page fault
            m[count++] = rs[i];
            pf++;
        }
        
        if (count == f) {
            count = 0;
        }
    }
    
    printf("\nThe number of Page faults: %d\n", pf);
    
    return 0;
}
