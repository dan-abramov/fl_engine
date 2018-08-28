module FlEngine
  class Engine < ::Rails::Engine
    isolate_namespace FlEngine
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
