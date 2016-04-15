class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #list all joined and owned activities
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities

  #list only owned activities
  has_many :organized_user_activities, -> { where(role: "organizer")}, class_name: "UserActivity"
  has_many :organized_activities, through: :organized_user_activities, class_name: "Activity", source: :user

  #list only joined activities
  has_many :joined_user_activities, -> { where(role: "joiner")}, class_name: "UserActivity"
  has_many :joined_activities, through: :joined_user_activities, class_name: "Activity", source: :user

  def self.generate_token
    loop do
      token = Devise.friendly_token
      break token unless self.exists?(api_key: token)
    end
  end

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.name = auth[:name]
      user.email = auth[:email]
      user.image = auth[:picture]
      user.api_key = generate_token
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def organized_activities
    user_activities.organizers.map(&:activity)
  end
end
