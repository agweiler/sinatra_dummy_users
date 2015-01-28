class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :full_name, :email, :password, presence: true
  def self.authenticate(email, password)
    self.find_by(email:email, password:password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end
