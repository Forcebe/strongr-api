class Routine < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :workouts
  has_many :exercises, :through => :workouts
end
