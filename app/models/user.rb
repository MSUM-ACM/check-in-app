class User < ActiveRecord::Base
  validates :name, presence: true
  comma do
   name
   email
  end

  def display_name
   self.name.blank? ? self.email : self.name
  end
end
