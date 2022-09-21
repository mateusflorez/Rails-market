class Admin < ApplicationRecord
  enum role: [:administrator, :moderator]

  scope :moderators, -> { where(:role => 1)}

  # Ex:- scope :active, -> {where(:active => true)}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
