namespace :plugins do

    plugins = %w[
        https://github.com/discourse/docker_manager.git
        https://github.com/discourse/discourse-akismet.git
        https://github.com/discourse/discourse-cakeday.git
        https://github.com/discourse/discourse-solved
        https://github.com/discourse/discourse-apple-auth
    ]


    desc "Install all plugins"
    task :install_all do
        puts "Installing all #{plugins.length} plugins"
        plugins.each do |plugin|
            puts "Install #{plugin}"

            dir_name = plugin.split('/').last.gsub('.git', '')
            puts "Dir name: #{dir_name}"

            if test("[ -d /var/www/discourse/plugins/#{dir_name} ]")
                puts "Plugin #{dir_name} already exists"
                next
            end

            on roles(:all) do
                within fetch(:d_exec_path) do
                    dexec `"cd /var/www/discourse/plugins && git clone #{plugin}"`
                end
            end
        end
    end

end