#include <stdio.h>
#include <string.h>

char states[20][20], result[20][20], copy[3];

int main() {
    FILE *ipfile = fopen("input.txt","r");
    if (!ipfile) return printf("Error opening file\n"),1;

    int n, k, i, end;
    char state[3], state1[3], state2[3], input[3];

    printf("Enter number of states: ");
    scanf("%d",&n);
    printf("Enter the states: ");
    for (k=0;k<n;k++) scanf("%s",states[k]);

    for (k=0;k<n;k++) {
        i=0;
        strcpy(state,states[k]);
        strcpy(copy,state);
        strcpy(result[i++],state);

        while ((end=fscanf(ipfile,"%s %s %s",state1,input,state2))!=EOF) {
            if (!strcmp(state,state1) && !strcmp(input,"e")) {
                strcpy(result[i++],state2);
                strcpy(state,state2);
            }
        }

        printf("Epsilon closure of %s = {",copy);
        for (int j=0;j<i;j++) {
            printf("%s",result[j]);
            if (j<i-1) printf(",");
        }
        printf("}\n");

        rewind(ipfile);
    }

    fclose(ipfile);
    return 0;
}
