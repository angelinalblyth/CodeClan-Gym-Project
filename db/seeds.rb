require("pry-byebug")

require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/booking.rb")

Member.delete_all()

member1 = Member.new({'first_name' => 'Angelina', 'last_name' => 'Blyth', 'membership_type' => 'Basic', 'date_of_birth' => '17-04-1990'})
member1.save()
member2 = Member.new({'first_name' => 'Grant', 'last_name' => 'McPhilemy', 'membership_type' => 'Basic', 'date_of_birth' => '24-09-1992'})
member2.save()
member3 = Member.new({'first_name' => 'Louise', 'last_name' => 'Reekie', 'membership_type' => 'Basic', 'date_of_birth' => '30-10-1988'})
member3.save()
member4 = Member.new({'first_name' => 'Christy', 'last_name' => 'Whyte', 'membership_type' => 'Basic', 'date_of_birth' => '21-01-1975'})
member4.save()

gymclass1 = GymClass.new({'title' => 'Boxing', 'description' => 'Great way to get a workout in and learn some skills at the same time! Bag and pad work along with general conditioning and core strengthening.', 'teacher' => 'Meg Smith', 'cost' => '5', 'duration' => '60'})
gymclass1.save()
