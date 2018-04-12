class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

 #laearnl accepts_nested_attributes_for :users

  def users_attributes=(user_attributes)
  	user_attributes.each do |i, user_attribute|
  		user = User.find_or_create_by(user_attribute)
  		self.users << user unless user.present?
  	end
  end
end
