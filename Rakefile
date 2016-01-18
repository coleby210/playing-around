require 'rake'

require ::File.expand_path('../runner', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
require 'active_support/core_ext'

namespace :db do
  desc "Create the database point_system"
  task :create do
    puts "Creating database at point_system if it doesn't exist..."
    exec("touch db/point_system.sqlite3")
  end

  desc "Drop the database point_system"
  task :drop do
    puts "Dropping database point_system..."
    exec("rm db/point_system.sqlite3")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

end
