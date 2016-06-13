module SpreeAbandonedOrders
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      def add_migrations
        run 'bundle exec rake railties:install:migrations'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts "Skipping rake db:migrate, don\'t forget to run it!"
        end
      end
    end
  end
end