require_relative "shared"

namespace :util do

  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  desc "Export settings etc and zip"
  task :export do

    on roles(:all) do
      within fetch(:d_exec_path) do
        dexec `rake site:export_structure[/shared/backups/configuration_backup.zip]`
        download! "#{fetch(:d_public_path)}/backups/configuration_backup.zip", "configuration_backup.zip"
        puts "Downloaded configuration_backup.zip"
      end
    end

  end

  desc "Import settings etc"
  task :import do

    # get the filename
    ask :filename, "configuration_backup.zip"

    on roles(:all) do
      #rake site:import_structure[filename]
      within fetch(:d_exec_path) do
        upload! fetch(:filename), "#{fetch(:d_public_path)}/backups/#{fetch(:filename)}"
        dexec `rake site:import_structure[/shared/backups/#{fetch(:filename)}]`
      end

    end

  end

end