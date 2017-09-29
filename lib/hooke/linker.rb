require 'bundler'
module Hooke
  # Link .git_hooks directory to .git/hooks
  class Linker
    attr_reader :app_dir

    def initialize
      @app_dir = File.expand_path(Bundler.root)
    end

    def symlink
      fail_with_link_error unless linkable?
      install_status = Dir.chdir(app_dir) do
        backup_directory('./.git/hooks')
        File.symlink("#{app_dir}/git_hooks", "#{app_dir}/.git/hooks")
      end
      install_status
    end

    private

    def backup_directory(path)
      return unless Dir.exist?(path)
      if File.symlink?(path)
        File.unlink(path)
      else
        STDOUT.puts "Renaming #{path}"
        File.rename(path, "#{path}_bk_#{Time.now}")
      end
    end

    def linkable?
      Bundler.git_present? &&
        Dir.exist?("#{app_dir}/.git") &&
        Dir.exist?("#{app_dir}/git_hooks")
    end

    def fail_with_link_error
      STDERR.puts(
        ['-' * 60,
         'The following conditions are not satisfied',
         "1. Git installed? - #{Bundler.git_present?}",
         "2. .git present? -  #{Dir.exist?("#{app_dir}/.git")}",
         "3. git_hooks present? - #{Dir.exist?("#{app_dir}/git_hooks")}",
         '-' * 60]
      )
      raise 'Cannot be linked'
    end
  end
end
