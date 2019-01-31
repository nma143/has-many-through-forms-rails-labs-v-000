class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_username
    self.user  ? self.users.username : nil
  end

  def user_attributes=(user_hash)
    # Do not create a user if it doens't have a username
    if user_hash[:username].present?
      user = User.find_or_create_by(username: user_hash[:username])
      self.user_id=user.id
    end
  end

end
