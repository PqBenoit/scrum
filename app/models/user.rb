class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:name]

    validates :name, uniqueness: true

    has_many :teams
    has_many :tournament_users
    has_many :tournaments, :through => :tournament_users
end
