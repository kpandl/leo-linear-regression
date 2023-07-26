# Linear Regression in Leo - Overview

This repository showcases univariate linear regression (LR) implemented in Leo for use in a zkSNARK. The method implemented is Ordinary Least Squares, a standard approach to LR. This repository comprises two subprojects. First, a simple example of using LR in the folder linear-regression-example. Second, a program to benchmark the performance of proving the LR implementation with regard to the number of training data points in the folder benchmarking.

Please find the descriptions for both projects below.

# Example Code for Linear Regression in Leo

Running this Leo program computes the LR model from a set of training data points and stores the LR model parameters, consisting of a slope and an offset, in an Aleo record.

## Usage Guide

Make sure you have [Leo installed](https://developer.aleo.org/getting_started/) and that you have the opened the terminal in the `linear-regression-example` folder. This code was tested with Leo 1.9.1 (you can check it with `leo --version`, and update with `leo update`). The training data points are passed into Leo through the console. You can modify the input values as needed. Each x and y pair represents a data point for the linear regression model. You can also modify the number of training data points by adjusting the code.

To compile and run this Leo program, run:
```bash
leo run main "{ p1: {x: -1000i32,y: -1500i32}, p2: {x: 0i32,y: 800i32}, p3: {x: 500i32,y: 2000i32}, p4: {x: 1500i32,y: 4000i32}, p5: {x: 2300i32,y: 6000i32}}"
```
The output will look something like this:

```bash
Leo Compiled 'main.leo' into Aleo instructions
Leo ✅ Built 'lr1.aleo' (in "/linear-regression/build")
⛓  Constraints
 •  'lr1.aleo/main' - 8,144 constraints (called 1 time)
➡️  Output
 • {
  owner: ...,
  slope: 2i32.private,
  offset: 940i32.private,
  _nonce: ...
}
Leo ✅ Executed 'lr1.aleo/main' (in "/linear-regression/build")
```

Here `owner` is the address of the caller, `offset` and `slope` are the computed LR model parameters, and `_nonce` is a unique identifier.

## Further Optimizations and Future Work
### Computational Accuracy
The current approach works reasonably well if the ranges of values in the x and y coordinates are high, and the accuracy requirements are not stringent, due to Leo's native support for integer variables and lack of support for floating-point numbers. To achieve higher computational accuracy, you can implement fixed-point numbers, similar to how they are used for neural networks in Leo (see these resources: [fixed-point arithmetic in Leo](https://www.aleo.org/post/fixed-point-arithmetic-in-the-zksnark-based-programming-language-leo), [building neural networks with fixed-point arithmetic in Leo](https://www.aleo.org/post/neural-network-inference-with-the-zksnark-based-programming-language-leo-using-fixed-point-arithmetic)). In the example above, the results were `2` for the slope and `940` for the offset, whereas the more exact results are `2.24` and `778.49`.

### Constraint Efficiency
For larger datasets or in cases with a high number of independent variables, circuit sizes can grow large, and constraint efficiency becomes crucial. One promising approach, described in section 7.2 of [this paper [1]](https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-wu.pdf), is to verify that the LR model was correctly computed, rather than computing it directly within the proof (which would require costly matrix inversions). The utility of both methods should be similar in most practical cases, as they both aim to verify the correctness of the model.

[1] Wu, H., Zheng, W., Chiesa, A., Popa, R. A., & Stoica, I. (2018). {DIZK}: A distributed zero knowledge proof system. In 27th USENIX Security Symposium (USENIX Security 18) (pp. 675-692).

# Benchmarking of Different Training Dataset Sizes

We now have a version of LR in Leo that works with a small, fixed-size training dataset. To get a better understanding of the scalability, we want to benchmark the LR circuits with regard to the number of data points. For this, we need a program that automatically generates Leo code for different LR dataset sizes, and conducts corresponding experiments. In each experiment, the number of circuit constraints, the proving time, and the maximum RAM usage is tracked. Throughout the experiments, the number of training data points increases, and the code automatically starts the next experiment.

## Usage Guide

Make sure you have Python 3 installed, and you have the terminal opened in the `benchmarking` folder. This code was tested with Python 3.9.6 (you can check it with `python3 --version`). Also make sure you have the Python libraries `psutil` and `matplotlib` installed - if you don't, you can install these by `python3 -m pip install psutil matplotlib`.

To avoid influencing the experimental results, make sure you do not have any resource-intensive applications running. Conducting the benchmarks can take up to ca. an hour.

To conduct the benchmarks, run 1_run_benchmark.py with the command `python3 1_run_benchmark.py`.
The output will look something like this:

```bash
Finished benchmarking for 2 data points. Result: 9178 constraints, 17.225887060165405 runtime, 1.83026123046875 GB max memory
Finished benchmarking for 4 data points. Result: 12350 constraints, 17.65558886528015 runtime, 2.414520263671875 GB max memory
Finished benchmarking for 8 data points. Result: 18694 constraints, 17.775144815444946 runtime, 2.5152587890625 GB max memory
...
```

You will receive the benchmarking results live in the terminal, the program doubles the number of inputs up to 1024 (you can modify that in the code). The benchmarking results are also stored in the file `benchmark_results.csv`.

Once the benchmarking is finished, you can visualize the results from the CSV file by running 2_plot_results.py with the command `python3 2_plot_results.py`. The results should look similar to this:

![Number of constraints vs. number of data points](benchmarking/plot_constraints_vs_data_points.png?raw=true "Constraint scalability")
![Proving time vs. number of data points](benchmarking/plot_proving_time_vs_data_points.png?raw=true "Proving time scalability")
![Max memory vs. number of data points](benchmarking/plot_max_memory_vs_data_points.png?raw=true "Maximum memory consumption scalability")

## Further Optimizations and Future Work
### Larger Training Dataset Sizes
At the time of writing, Leo supports struct sizes of up to 32 fields, but this project aims to benchmark larger training dataset sizes than 32 data points. Therefore, the generated Leo code is slightly modified in the benchmarking section from the simple LR example above. Instead of passing the input as a struct of data points, we pass one input struct into the program, where the fields itself are structs consisting of up to 32 data points. Thus, the maximum number of supported data points is 32 x 32 = 1024. You can further optimize the program and accommodate a larger number of data points by increasing the depth of the structs, potentially even allowing for an arbitrary depth in the Python code.