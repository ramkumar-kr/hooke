require 'spec_helper'

describe Hooke::Linker do
  subject { Hooke::Linker.new.symlink }
  context '#symlink' do
    it 'fails if .git directory is not present' do
      with_tmpdir do |dir|
        allow(Bundler).to receive(:root).and_return(dir)
        expect { subject }.to raise_error('Cannot be linked')
      end
    end

    it 'fails if git_hooks directory is not present' do
      with_tmpdir do |dir|
        allow(Bundler).to receive(:root).and_return(dir)
        expect { subject }.to raise_error('Cannot be linked')
      end
    end

    context do
      it 'creates a symlink to .git/hooks directory' do
        with_tmpdir do |dir|
          allow(Bundler).to receive(:root).and_return(dir)
          Dir.mkdir('git_hooks')
          Dir.mkdir('.git')
          subject
          expect(File.symlink?('./.git/hooks')).to be_truthy
          expect(File.readlink('./.git/hooks')).to eq("#{dir}/git_hooks")
        end
      end

      it 'creates a symlink to .git/hooks directory' do
        with_tmpdir do |dir|
          allow(Bundler).to receive(:root).and_return(dir)
          Dir.mkdir('git_hooks')
          Dir.mkdir('.git')
          Dir.chdir("#{dir}/.git") { Dir.mkdir('hooks') }
          subject
          expect(Dir.entries("#{dir}/.git").any? { |name| name =~ /hooks_bk/ })
            .to be_truthy
        end
      end

      it 'removes symlink if hooks in .git is one' do
        with_tmpdir do |dir|
          allow(Bundler).to receive(:root).and_return(dir)
          Dir.mkdir('git_hooks')
          Dir.mkdir('.git')
          Dir.chdir("#{dir}/.git") { File.symlink('.', 'hooks') }
          expect(File.readlink("#{dir}/.git/hooks")).to eq('.')
          subject
          expect(File.readlink("#{dir}/.git/hooks")).to eq("#{dir}/git_hooks")
        end
      end
    end
  end
end
