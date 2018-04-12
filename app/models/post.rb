class Post < ActiveRecord::Base
	
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

 # accepts_nested_attributes_for :users

  def comments_attributes=(comment_attributes)
    comment_attributes.each do |i, comment_attribute|
      comment = Comment.find_or_create_by(comment_attribute)
      self.post_comments.build(:comment => comment)
    end
  end


  def categories_attributes=(category_attributes)
  	category_attributes.each do |i, category_attribute|
  		category = Category.find_or_create_by(category_attribute)
  		self.post_categories.build(:category => category)
  	end
  end
end
