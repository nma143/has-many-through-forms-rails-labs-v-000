class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_username
    self.user  ? self.users.username : nil
  end

  # def user_attributes=(user_hash)
  #
  #     # Do not create a user if it doens't have a username
  #     if user_hash[:username].present?
  #       user = User.find_or_create_by(username: user_hash[:username])
  #       #make the association between this user and this comment by adding a
  #       # row to the join table post_categories
  #         self.post_categories.build(:category => category)
  #       end
  #     end
  # end

end
