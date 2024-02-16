/*
    Alumno: Fidel Moises Apari Sanchez
    Codigo: 20212126
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

extern int diag_asm(int * mat, int N); // Inciso b
int preg_diag(int * mat, int N); // Inciso a

// Funciones extra
void imprimirMatrix(int * mat, int N);
int * crear_matriz(int N);

int main(){
    int mat1[] = {1,2,3,4,5,6,7,8,9};
    int mat2[] = {0,1,0,1,0,1,0,1,0};
    int N1 = 3, N2 = 3;

    int val_c, val_asm;

    // Inciso c

    printf("Matriz 1:\n------------\n\n");
    imprimirMatrix(mat1, N1);
    val_c = preg_diag(mat1, N1);
    printf("Resultado en C es: %i\n", val_c);
    val_asm = diag_asm(mat1, N1);
    printf("Resultado en Asm es: %i\n", val_asm);

    printf("\nMatriz 2:\n------------\n\n");
    imprimirMatrix(mat2, N2);
    val_c = preg_diag(mat2, N2);
    printf("Resultado en C es: %i\n", val_c);
    val_asm = diag_asm(mat2, N2);
    printf("Resultado en Asm es: %i\n", val_asm);

    // Inciso d
    srand(time(NULL));

    int N3 = 1023;
    int * mat_3 = crear_matriz(N3);

    // imprimirMatrix(mat_3, N3);

    int total_exec = 5;
    double speedup, results_c[total_exec], results_asm[total_exec];
    struct timespec ti, tf;
    double elapsed;

    printf("\n\nBenchmarks:\n-----------------\n\n");
    for(int i = 0; i < total_exec; i++){
        clock_gettime(CLOCK_REALTIME, &ti);
        preg_diag(mat_3, N3);
        clock_gettime(CLOCK_REALTIME, &tf);
        elapsed = (tf.tv_sec - ti.tv_sec) * 1e9 + (tf.tv_nsec - ti.tv_nsec);
        printf("Tiempo de ejecución N°%i en C es %.3lf ns\n", i+1, elapsed);
        results_c[i] = elapsed/1e4;

        clock_gettime(CLOCK_REALTIME, &ti);
        diag_asm(mat_3, N3);
        clock_gettime(CLOCK_REALTIME, &tf);
        elapsed = (tf.tv_sec - ti.tv_sec) * 1e9 + (tf.tv_nsec - ti.tv_nsec);
        printf("Tiempo de ejecución N°%i en Asm es %.3lf ns\n\n", i+1, elapsed);
        results_asm[i] = elapsed/1e4;
    }

    double ratio_c = 1, ratio_asm = 1;
    for(int i = 0; i < total_exec; i++){
        ratio_c *= results_c[i];
        ratio_asm *= results_asm[i];
    }
    ratio_c = pow(ratio_c, 1.0/total_exec);
    ratio_asm = pow(ratio_asm, 1.0/total_exec);
    printf("\n\nRatio C: %.3lf\n", ratio_c);
    printf("Ratio en Asm: %.3lf\n", ratio_asm);

    speedup = ratio_c / ratio_asm;
    printf("SpeeUp (C/Asm): %.3lf\n", speedup);

    free(mat_3);

    return 0;
}

int preg_diag(int * mat, int N){
    int val1 = 0, med = N/2, mul1 = 0, mul2 = 0, res = N - 1;

    for(int i = 0; i < N; i++){
        mul1 += N;
        mul2 += med;
        res -= i;
        val1 += mat[ mul1 + i ] + mat[ mul1 + res ] - mat[ mul1 + med ] - mat[ mul2 + N ];
    }

    return val1 == 0;
}

// Funciones extra
void imprimirMatrix(int * mat, int N){
    for(int i = 0; i < N; i++){
        printf("[ ");
        for(int j = 0; j < N; j++){
            printf(" %i,", mat[i*N + j]);
        }
        printf(" ],\n");
    }
    printf("\n");
}

int * crear_matriz(int N){
    int * mat;
    int total = N * N;
    mat = malloc( total * sizeof(int) );
    for(int i = 0; i < total; i++)
        mat[i] = random() % 100;

    return mat;
}