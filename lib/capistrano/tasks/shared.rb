# define discourse_path
set :d_exec_path, "/home/ubuntu/PRMERS-discourse"
set :d_public_path, "/var/discourse/shared/standalone"

def dexec(command)
    execute :sudo, "./launcher", "run", "app", command
end