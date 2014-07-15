class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true,
                  uniqueness: true
                  

  has_many :statuses, dependent: :destroy

  def full_name
    first_name + " " + last_name
  end
end
