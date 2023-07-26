import subprocess
import time
import os
import psutil
import math

def generate_leo_program(num_data_points, integer_type="i64"):
    leo_program = """program lr1.aleo {
    record LR_model {
        owner: address,
        slope: """ + integer_type + """,
        offset: """ + integer_type + """,
    }

    struct Point {
        x: """ + integer_type + """,
        y: """ + integer_type + """,
    }

    struct TrainingDataset {"""
    for i in range(min(32,num_data_points)):
        leo_program += """
        p{}: Point,""".format(i)

    leo_program += """
    }

    struct TrainingDatasetCollection {"""
    for i in range(math.ceil(num_data_points/32)):
        leo_program += """
        td{}: TrainingDataset,""".format(i)

    leo_program += """
    }

    transition main(dsc: TrainingDatasetCollection) -> LR_model {
        let num_points: """ + integer_type + """ = """
    leo_program += str(num_data_points)
    leo_program += integer_type + """;
        let sum_x: """ + integer_type + " = "
    for i in range(num_data_points):
        leo_program += "dsc.td{}.p{}.x + ".format(math.floor(i/32),i%32)
    leo_program = leo_program[:-3]
    
    leo_program += """;
        let sum_y: """ + integer_type + """ = """
    for i in range(num_data_points):
        leo_program += "dsc.td{}.p{}.y + ".format(math.floor(i/32),i%32)
    leo_program = leo_program[:-3]

    leo_program += """;
        let sum_xy: """ + integer_type + """ = """
    for i in range(num_data_points):
        leo_program += "dsc.td{}.p{}.x * dsc.td{}.p{}.y + ".format(math.floor(i/32),i%32, math.floor(i/32),i%32)
    leo_program = leo_program[:-3]

    leo_program += """;
        let sum_of_squared_x: """ + integer_type + """ = """
    for i in range(num_data_points):
        leo_program += "dsc.td{}.p{}.x * dsc.td{}.p{}.x + ".format(math.floor(i/32),i%32, math.floor(i/32), i%32)
    leo_program = leo_program[:-3]

    leo_program += """;

        let numerator_m: """ + integer_type + """ = num_points * sum_xy - sum_x * sum_y;
        let denominator_m: """ + integer_type + """ = num_points * sum_of_squared_x - sum_x * sum_x;
        let m: """ + integer_type + """ = numerator_m / denominator_m;
        let b: """ + integer_type + """ = (sum_y - m * sum_x) / num_points;

        return LR_model {
            owner: self.caller,
            slope: m,
            offset: b,
        };
    }

}"""
    
    # write to /src/main.leo
    with open(os.path.join(os.getcwd(), "src", "main.leo"), 'w') as file:
        file.write(leo_program)

def generate_inputs(x_values, y_values, integer_type="i64"):
    # generate the inputs
    inputs = "{"
    outer_loop_ceil = math.ceil(len(x_values)/32)
    inner_loop_ceil = min(32, len(x_values))
    for i in range(outer_loop_ceil):
        inputs += "td{}: {{".format(i)
        sliced_x_values = x_values[i*inner_loop_ceil:(i+1)*inner_loop_ceil]
        sliced_y_values = y_values[i*inner_loop_ceil:(i+1)*inner_loop_ceil]
        
        for j in range(inner_loop_ceil):
            if(j >= len(sliced_x_values)):
                x = 0
                y = 0
            else:
                x = sliced_x_values[j]
                y = sliced_y_values[j]
            inputs += "p{}: {{x: {}{}, y: {}{}}},".format(j, x, integer_type, y, integer_type)
        inputs = inputs[:-1]
        inputs += "},"

    inputs = inputs[:-1]
    inputs += "}"
    return inputs

def get_memory_usage(pid):
    """Return the memory usage in GB of a process."""
    process = psutil.Process(pid)
    mem_info = process.memory_info()
    return mem_info.rss / 1024 ** 3

def get_memory_usages_by_name(proc_name):
    """Return the memory usage in GB of all processes with a certain name."""
    mem_usages = []
    for proc in psutil.process_iter(['pid', 'name']):
        if proc.info['name'] == proc_name:
            process = psutil.Process(proc.info['pid'])
            mem_info = process.memory_info()
            mem_usages.append(mem_info.rss / 1024 ** 3)
    return mem_usages

def benchmark(inputs):
    # Leo program command
    command = ['leo', 'run', 'main', inputs]

    max_memory = 0

    # Start Leo program
    start = time.time()
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    # Measure memory usage every second

    while process.poll() is None:
        try:
            memory_usage_pid = get_memory_usage(process.pid)
            memory_usage_name = sum(get_memory_usages_by_name("leo"))
            memory_usage = max(memory_usage_pid,memory_usage_name)
            if(memory_usage > max_memory):
                max_memory = memory_usage
            time.sleep(0.1)
        except psutil.NoSuchProcess:
            break

    end = time.time()

    # Get the output
    stdout, stderr = process.communicate()
    result = stdout.decode() + stderr.decode()

    runtime = end - start

    # Check if "Finished" is in the results string
    success = "Finished" in result
    if success:
        # Extract the number before the word "constraints" in the results string
        constraints = result.split("constraints")[0].split()[-1].replace(",", "")
        return constraints, runtime, max_memory
    else:
        print("Error:", result)
        return -1, -1, -1