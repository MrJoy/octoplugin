class Octoplugin < Octodemo::Plugin
  VERSION='0.0.1'

  def self.init_rake!(ctx)
    puts "Setting up rake tasks!"
    ctx.instance_eval do
      desc "Some task."
      task :some_task do
        puts "Doing something!"
      end
    end
  end
end
