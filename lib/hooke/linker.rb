require 'bundler'
module Hooke
  class Linker
    def symlink
      app_dir = File.expand_path(Bundler.root)
      if Dir.exist?("#{app_dir}/.git")
        install_status = Dir.chdir (app_dir) do
          if Dir.exist?("./.git/hooks")
            if(File.symlink?("./.git/hooks"))
              File.unlink("./.git/hooks")
            else
              STDERR.puts "Renaming hooks directory"
              File.rename("./.git/hooks", "./.git/hooks_bk_#{Time.now}")
            end
          end
          File.symlink("#{app_dir}/git_hooks", "#{app_dir}/.git/hooks")
        end
      else
        STDERR.puts ["-" * 60, "The directory #{app_dir}/.git does not exist. Please run `git init` and then run `bundle install`", "-" * 60]
        fail "Not a git directory"
      end

      STDERR.puts(
        *if install_status
           ''
         else
           ['-' * 60,
            "Command to hook failed with status #{install_status}",
            '-' * 60]
         end
      )
      install_status
    end
  end
end



























