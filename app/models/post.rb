class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments


  def categories_attributes=(categories_hash)
    categories_hash.each do |i, category_attributes|
      #find or create the category regardless of whether this post has it
      # Do not create a category if it doens't have a name
      if category_attributes[:name].present?

        category = Category.find_or_create_by(name: category_attributes[:name])
        #make the association between this category and this post by adding a
        # row to the join table post_categories
        # Also, don't add a category to a post if it already has it
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end
    end
  end

end
