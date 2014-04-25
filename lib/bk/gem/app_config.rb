require 'bk/gem/app_config/version'

require 'hashie'
require 'yaml'

##
# A wrapper to create a Hashie::Mash and populate it
class AppConfigImpl

  def self.configure
    mash               = Hashie::Mash.new
    mash.project!.root = project_root
    mash.env           = env
    mash.verbose       = false
    mash.lib_dir       = lib_dir(mash)
    add_to_load_path(mash)
    bundle_require(mash)
    mash
  end

  private

  def self.project_root
    File.expand_path('../../..', __dir__)
  end

  def self.env
    ENV['RACK_ENV'] || 'development'
  end

  def self.lib_dir(mash)
    File.expand_path(File.join(mash.project.root, 'lib'))
  end

  def self.add_to_load_path(mash)
    $LOAD_PATH.unshift(mash.lib_dir) unless $LOAD_PATH.include?(mash.lib_dir)
  end

  def self.bundle_require(mash)
    Bundler.require(:default, mash.env)
  end

end

module Hashie
  ##
  # Monkey patch inject a method
  class Mash
    def yaml_inject(key, yaml_file)
      data = { key.to_sym => YAML.load_file(yaml_file) }
      self.deep_update(Hashie::Mash.new(data))
    end
  end
end

AppConfig = AppConfigImpl.configure
