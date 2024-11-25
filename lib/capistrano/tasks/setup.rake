namespace :setup do
    desc 'Set up the server'
    task :install_dependencies do
        on roles(:all) do
            execute 'sudo apt update && sudo apt install -y curl git nginx'
        end
    end

    desc 'Upload configuration files'
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
end