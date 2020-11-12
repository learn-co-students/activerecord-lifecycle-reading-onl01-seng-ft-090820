class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  before_validation :make_title_case
  #when u are modifying an attribute of a model, use before_validation -- if you are doing some other action, then use before_save

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
