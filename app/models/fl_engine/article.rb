module FlEngine
  class Article < ActiveRecord::Base
    belongs_to :postable, polymorphic: true
    validates :title, :text, presence: true
  end
end
