module Users
  module Postable
    extend ActiveSupport::Concern
    included do
      has_many :articles, as: :postable, class_name: 'FlEngine::Article', dependent: :destroy
    end
  end
end
