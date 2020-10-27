class Recipe < ApplicationRecord
    mount_uploader :image_recipe, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_recipes, through: :likes, source: :user
    
    validates :title, {presence: true}
    validates :content, {presence: true}
    
    def user
        return User.find_by(id: self.user_id)
    end
end
