# RISC-V Neural Network
## Brief
컴퓨터 구조론 과목 기말 프로젝트 코드입니다. RISC-V를 통하여 MNIST 데이터셋의 분류 모델을 만드는 프로젝트에서 ReLU, argmax, matmul 등의 함수를 어셈블리로 구현했습니다.

## Mission
RISC-V를 이용해 ReLU, argmax, matmul 함수 구현. main.s를 실행했을 때 각자 링크될 수 있도록 s 레지스터가 겹치지 않도록 레지스터 분배.

## Environment
 - Ubuntu 18.04
 - JRE
 - Python 3
 - [Venus](https://venus.cs61c.org/)

## Usage
 - MNIST Hand-written number   
    Using existing MNIST inputs (mnist_input0~9.bin)
    ```console
    $java -jar venus.jar main.s -ms 10000000 inputs/mnist/bin/m0.bin inputs/mnist/bin/m1.bin inputs/mnist/bin/inputs/mnist_input0.bin  output.bin
    ```
 - Your own hand-written number   
    Save hand-written 28*28 pixels .bmp file in /inputs/mnist/student_inputs/.   
    ```console
    $cd inputs/mnist/student_inputs/
    $python bmp_to_bin.py example
    $cd ../../../
    $java -jar venus.jar main.s -ms 10000000 -it inputs/mnist/bin/m0.bin inputs/mnist/bin/m1.bin inputs/mnist/student_inputs/example.bin  output.bin
    ```
프로젝트는 UC Berkeley의 CS-61C 수업의 2번째 과제와 동일합니다.
