from helper_benchmark import generate_leo_program, generate_inputs, benchmark

experiment_list_data_points = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

x_range = [-1000, 1000]

def sampled_function(x):
    return 2*x + 1

# generate new csv file
with open('benchmark_results.csv', 'w') as file:
    file.write("data_points, constraints, runtime, max_memory\n")

for data_points in experiment_list_data_points:
    # sample x values, compute y values
    x_values = [int(x_range[0] + i * (x_range[1] - x_range[0]) / (data_points - 1)) for i in range(data_points)]
    y_values = [sampled_function(x) for x in x_values]

    integer_type = "i64"
    if(data_points >= 64):
        integer_type = "i64"

    # generate leo program
    generate_leo_program(data_points, integer_type=integer_type)

    # generate the inputs
    inputs = generate_inputs(x_values, y_values, integer_type=integer_type)

    # benchmark the program
    constraints, runtime, max_memory = benchmark(inputs)
    
    # save the results in csv file
    with open('benchmark_results.csv', 'a') as file:
        file.write("{}, {}, {}, {}\n".format(data_points, constraints, runtime, max_memory))
    
    print("Finished benchmarking for {} data points. Result: {} constraints, {} runtime, {} GB max memory".format(data_points, constraints, runtime, max_memory))