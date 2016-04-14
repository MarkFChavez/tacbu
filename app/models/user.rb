class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities, dependent: :destroy
  has_many :owned_user_activities, -> { where(role: "owner")}, class_name: "UserActivity"
  has_many :owned_activities, through: :owned_user_activities, class_name: "Activity", source: :user
  has_many :activities, through: :user_activities

  has_many :joined_user_activities, -> { where(role: "joiner")}, class_name: "UserActivity"
  has_many :joined_activities, through: :joined_user_activities, class_name: "Activity", source: :user




end
