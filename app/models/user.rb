class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #need to create an association between the user model and the mentions model
  #make sure to run a "rails g migration"
  #then "rake db:migrate"
  has_many :mentions

end
