# Linear regression in Leo - benchmarking

This section is for the benchmarking of the linear regression circuit with regard to the number of data points. For this, first run 1_run_benchmark.py to create the benchmark results, and then use the 2_plot_results.py file to plot the results.

Internally, the benchmarkin process works by conducting multiple experiments, in each experiment watching the number of circuit constraints, the proving time, and the maximum RAM usage. Throught the experiments, the number of training data points increases, and the Python code automaticallly generates Leo code for the experiment and starts the experiment.