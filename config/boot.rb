require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
# add the lib dir of the engine if we are running as a dummy app for an engine
$LOAD_PATH.unshift(File.expand_path('../../../lib', __dir__)) if defined?(ENGINE_ROOT)

require 'rails/commands/server'

module Rails
  class Server
    alias :default_options_bk :default_options
    def default_options
      default_options_bk.merge!(Host: '0.0.0.0')
    end
  end
end

