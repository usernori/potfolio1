class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :image_user, ImageUploader
  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe
  
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  def already_liked?(recipe)
    self.likes.exists?(recipe_id: recipe.id)
  end
end
