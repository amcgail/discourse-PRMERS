namespace :setup do
    desc 'Upload configuration files'
    # 'Note these are not needed if NGINX is configured already'
    task :upload_config do
        on roles(:all) do
            puts fetch(:deploy_to)
            upload!('config/nginx.conf', '/home/ubuntu/PRMERS.conf')
            execute 'sudo mv /home/ubuntu/PRMERS.conf /etc/nginx/sites-available/PRMERS'

            if not test("[ -f /etc/nginx/sites-enabled/PRMERS ]")
                execute 'sudo ln -s /etc/nginx/sites-available/PRMERS /etc/nginx/sites-enabled/'
            end

            execute 'sudo systemctl reload nginx'
        end
    end

    desc 'Create symlinks'
    task :symlink_plugins do
        on roles(:app) do
          # Define paths
          target_plugins_dir = "/home//plugins" # Path to plugins directory in the target repository
          plugin_dir = fetch(:plugin_dir)               # Fetch the $PLUGIN_DIR value from Capistrano variables
    
          # Ensure the $PLUGIN_DIR exists
          execute :mkdir, '-p', plugin_dir
    
          # Create symlinks for each plugin folder
          within target_plugins_dir do
            plugin_folders = capture(:ls, '-1').split("\n")
            plugin_folders.each do |folder|
              target_path = File.join(target_plugins_dir, folder)
              symlink_path = File.join(plugin_dir, folder)
    
              # Remove existing symlink if any, then create a new one
              execute :rm, '-f', symlink_path
              execute :ln, '-s', target_path, symlink_path
            end
          end
        end
      end
end