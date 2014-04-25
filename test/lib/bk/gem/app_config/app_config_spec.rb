require 'bk/gem/minitest'
BK::Gem::Minitest::SpecHelper.base do |config|
  require 'bk/gem/app_config'
end

describe 'AppConfig' do

  it 'configures base values' do
    gem_root = File.expand_path('../../../../..', __dir__)
    AppConfig.project.root.must_equal gem_root
    AppConfig.env.must_equal 'test'
    AppConfig.lib_dir.must_equal "#{gem_root}/lib"
    AppConfig.verbose.must_equal false
  end

  it 'merges yaml files' do
    yaml_file = File.expand_path('../../../../support/database.yml', __dir__)
    AppConfig.yaml_inject(:database, yaml_file)
    AppConfig.database.development.adapter.must_equal 'sqlite3'
  end

end
