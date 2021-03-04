class Post < ApplicationRecord
    belongs_to :blogger 
    belongs_to :destination
    after_initialize :init

    validates :title, presence: true 
    validates :content, presence: true, length: {minimum: 100}

    def init
        self.likes = 0
    end

end
