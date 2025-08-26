#include <iostream>
#include <cuda_runtime.h>

__global__ void hello_kernel()
{
    // device-side printf is supported in CUDA (requires proper compute capability)
    printf("Hello from GPU (block %d thread %d)\n", blockIdx.x, threadIdx.x);
}

int main()
{
    // launch one block with one thread
    hello_kernel<<<1, 1>>>();

    // wait for kernel to finish and check for errors
    cudaError_t err = cudaDeviceSynchronize();
    if (err != cudaSuccess) {
        std::cerr << "CUDA error: " << cudaGetErrorString(err) << std::endl;
        return 1;n
    }

    std::cout << "Hello from host!" << std::endl;
    return 0;
}