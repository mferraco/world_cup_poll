# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/rails/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/rails/current/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/rails/current/log/unicorn.log"
stdout_path "/home/rails/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.worldcupchallenge.sock"
listen "/tmp/unicorn.worldcupchallenge.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30