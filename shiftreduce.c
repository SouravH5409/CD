#include <stdio.h>
#include <string.h>

char inp[100];
int len;
char stack[100];
int top = -1; 

void print_details(int ind, const char *action)
{
    printf("%-20s %-20s %-10s\n", stack, inp + ind, action);
}

void check_for_reduce(int i)
{
    int flag = 1;
    while (flag)
    {
        flag = 0;

        if (top >= 2 && stack[top - 2] == 'S' && stack[top - 1] == '+' && stack[top] == 'S')
        {
            stack[top - 2] = 'S';
            top -= 2;
            stack[top + 1] = '\0';
            print_details(i + 1, "REDUCE");
            flag = 1;
        }
        else if (top >= 2 && stack[top - 2] == 'S' && stack[top - 1] == '-' && stack[top] == 'S')
        {
            stack[top - 2] = 'S';
            top -= 2;
            stack[top + 1] = '\0';
            print_details(i + 1, "REDUCE");
            flag = 1;
        }
        else if (top >= 2 && stack[top - 2] == '(' && stack[top - 1] == 'S' && stack[top] == ')')
        {
            stack[top - 2] = 'S';
            top -= 2;
            stack[top + 1] = '\0';
            print_details(i + 1, "REDUCE");
            flag = 1;
        }
        else if (top >= 0 && stack[top] == 'i')
        {
            stack[top] = 'S';
            stack[top + 1] = '\0';
            print_details(i + 1, "REDUCE");
            flag = 1;
        }
    }
}

int main()
{
    printf("Enter input: ");
    scanf("%s", inp);
    len = strlen(inp);

    printf("\n%-20s %-20s %-10s\n", "Stack", "Input", "Action");
    printf("-------------------------------------------------------------\n");

    for (int i = 0; i < len; i++)
    {
        top++;
        stack[top] = inp[i];
        stack[top + 1] = '\0';

        print_details(i, "SHIFT");
        check_for_reduce(i);
    }

    if (top == 0 && stack[0] == 'S')
        printf("\nAccepted.\n");
    else
        printf("\nRejected.\n");

    return 0;
}

