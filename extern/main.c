#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

extern float innerProd(float *a, float *b, int n);
void initVector(float *v, int n);
float cInnerProd(float *a, float *b, int n);

int main(){
    srandom(time(NULL));

    float *a, *b, resultC, resultAsm;

    int N = 1024;

    a = malloc(N * sizeof(float));
    b = malloc(N * sizeof(float));

    int i = 0;

    initVector(a, N);
    initVector(b, N);

    struct timespec t1, tf;
    double  elapsed;

    clock_gettime(CLOCK_REALTIME, &t1);
    resultC = cInnerProd(a, b, N);
    clock_gettime(CLOCK_REALTIME, &tf);
    elapsed = (tf.tv_sec - t1.tv_sec) * 1e9 + (tf.tv_nsec - t1.tv_nsec);
    printf("El tiempo en nanosegundos transcurrido para la función en C es: %lf. El resultado es: %f\n", elapsed, resultC);

    clock_gettime(CLOCK_REALTIME, &t1);
    resultAsm = innerProd(a, b, N);
    clock_gettime(CLOCK_REALTIME, &tf);
    elapsed = (tf.tv_sec - t1.tv_sec) * 1e9 + (tf.tv_nsec - t1.tv_nsec);
    printf("El tiempo en nanosegundos transcurrido para la función en Asm es: %lf. El resultado es: %f\n", elapsed, resultAsm);

    float relerr = fabsf(resultC - resultAsm)/fabsf(resultC);
    printf("El error relativo es %f\n", relerr);

    free(a);
    free(b);
    return 0;
}

void initVector(float *v, int n){
    for(int i = 0; i < n; i ++){
        float e = random() % 255;
        v[i] = (sinf(e) + cosf(e));
    }
}

float cInnerProd(float *a, float *b, int n){
    float result = 0;
    for(int i = 0; i < n; i++)
        result += a[i]*b[i];
    return result;
}