class Workout < ApplicationRecord
belongs_to :routine, :optional => true
has_many :exercises

end
