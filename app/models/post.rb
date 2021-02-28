class Post < ApplicationRecord
    belongs_to :blogger 
    belongs_to :destination
    after_initialize :init

    validates :title, presence: true 
    validates :content, presence: true, length: {minimum: 100}
    after_initialize :init

    def init
        self.likes = 0 if self.likes.nil?
    end

end
