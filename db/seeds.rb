User.destroy_all

puts "Creating Users..."
u1 = User.create :username => 'sample', :email => 'sample@ga.com', :password => 'chicken'

Routine.destroy_all

puts "Creating Routines..."
r1 = Routine.create :name => 'Lifting'
r2 = Routine.create :name => 'Calisthenics'

puts "Associanting Users and Routines..."
u1.routines << r1 <<  r2

Workout.destroy_all

puts "Creating workouts..."
w1 = Workout.create :name => 'w1 Monday'
w2 = Workout.create :name => 'w1 Wednesday'
w3 = Workout.create :name => 'w1 Friday'

w4 = Workout.create :name => 'Upper body'
w5 = Workout.create :name => 'Lower body'

puts "Assoicating Workouts and Routines"
r1.workouts << w1 << w2 << w3
r2.workouts << w4 << w5

Exercise.destroy_all

puts "Creating Exercises"

rand_weight = rand(20.0..122.5).round(1)
rand_reps = rand(1..10)

e1 = Exercise.create :name => 'Chinup', :weight => 0, :reps => 5
e2 = Exercise.create :name => 'Dip', :weight => rand_weight, :reps => rand_reps
e3 = Exercise.create :name => 'Push Up', :weight => rand_weight, :reps => rand_reps
e4 = Exercise.create :name => 'Bench Press', :weight => rand_weight, :reps => rand_reps
e5 = Exercise.create :name => 'Deadlift', :weight => rand_weight, :reps => rand_reps
e6 = Exercise.create :name => 'Overhead Press', :weight => rand_weight, :reps => rand_reps
e7 = Exercise.create :name => 'Barbell Squat', :weight => rand_weight, :reps => rand_reps
e8 = Exercise.create :name => 'Dumbell Bench', :weight => rand_weight, :reps => rand_reps
e9 = Exercise.create :name => 'Dumbell Curl', :weight => rand_weight, :reps => rand_reps
e10 = Exercise.create :name => 'Human Flag', :weight => rand_weight, :reps => rand_reps

puts "Associating exercises with workouts"

w1.exercises << e2 << e1 << e4
w2.exercises << e5 << e8 << e9
w3.exercises << e6 << e7 << e3

w4.exercises << e10 << e1 << e3
w5.exercises << e1 << e2 << e3
