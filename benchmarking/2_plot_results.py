import matplotlib.pyplot as plt

# Plot the results
with open('benchmark_results.csv', 'r') as file:
    lines = file.readlines()
    data_points = [int(line.split(",")[0]) for line in lines[1:]]
    constraints = [int(line.split(",")[1]) for line in lines[1:]]
    runtime = [float(line.split(",")[2])/60 for line in lines[1:]]
    max_memory = [float(line.split(",")[3]) for line in lines[1:]]

plt.figure(1)
plt.plot(data_points, constraints, marker='x')
plt.xlabel("Number of data points")
plt.ylabel("Number of constraints")
plt.title("Number of constraints vs. number of data points")
plt.savefig("plot_constraints_vs_data_points.png")

plt.figure(2)
plt.plot(data_points, runtime, marker='x')
plt.xlabel("Number of data points")
plt.ylabel("Proving time (min)")
plt.title("Proving time vs. number of data points")
plt.savefig("plot_proving_time_vs_data_points.png")

plt.figure(3)
plt.plot(data_points, max_memory, marker='x')
plt.xlabel("Number of data points")
plt.ylabel("Max memory (GB)")
plt.title("Max memory vs. number of data points")
plt.savefig("plot_max_memory_vs_data_points.png")