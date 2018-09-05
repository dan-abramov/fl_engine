module FlEngine
  class Engine < ::Rails::Engine
    isolate_namespace FlEngine
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.to_prepare do
      User.send :has_many, :articles, as: :postable, class_name: 'FlEngine::Article', dependent: :destroy
    end
  end
end
