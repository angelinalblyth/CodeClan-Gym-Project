require("pry-byebug")

require_relative("../models/member.rb")
require_relative("../models/gym_class.rb")
require_relative("../models/booking.rb")

Member.delete_all()
GymClass.delete_all()
Booking.delete_all()

member1 = Member.new({
  'first_name' => 'Angelina',
  'last_name' => 'Blyth',
  'membership_type' => 'Basic',
  'date_of_birth' => '17-04-1990'
  })
member1.save()

member2 = Member.new({
  'first_name' => 'Christine',
  'last_name' => 'Weirich',
  'membership_type' => 'Basic',
  'date_of_birth' => '24-09-1992'
  })
member2.save()

member3 = Member.new({
  'first_name' => 'Louise',
  'last_name' => 'Reekie',
  'membership_type' => 'Basic',
  'date_of_birth' => '30-10-1988'
  })
member3.save()

member4 = Member.new({
  'first_name' => 'Christy',
  'last_name' => 'Whyte',
  'membership_type' => 'Basic',
  'date_of_birth' => '21-01-1975'
  })
member4.save()

gymclass1 = GymClass.new({
  'title' => 'Boxing',
  'description' => 'Great way to get a workout in and learn some skills at the same time! Bag and pad work along with general conditioning and core strengthening.',
  'teacher' => 'Meg Smith',
  'cost' => '5',
  'duration' => '60'
  })
gymclass1.save()

gymclass2 = GymClass.new({
  'title' => 'Circuits',
  'description' => 'Circuit training, develop strength, cardio fitness, agility, balance and burn calories for long after with this varied workout tailored to suit your abilities.',
  'teacher' => 'Abigail Johnston',
  'cost' => '5',
  'duration' => '60'
  })
gymclass2.save()

gymclass3 = GymClass.new({
  'title' => 'Kettlebells',
  'description' => 'Focusing on both fitness and the technical aspects of the sport lifts (jerk, snatch, long cycle).',
  'teacher' => 'Abigail Johnston',
  'cost' => '7',
  'duration' => '60'
  })
gymclass3.save()

gymclass4 = GymClass.new({
  'title' => 'Strength and Conditioning',
  'description' => 'Our Strength & Conditioning class is designed to help you develop your overall muscular strength and power. Whether you want to lose fat or build muscle working incorporating some strength work into your training can help you reach your goals! ',
  'teacher' => 'Meg Smith',
  'cost' => '7',
  'duration' => '60'
  })
gymclass4.save()

booking1 = Booking.new({
  'member_id' => member1.id,
  'gym_class_id' => gymclass3.id
  })
booking1.save()

booking2 = Booking.new({
  'member_id' => member4.id,
  'gym_class_id' => gymclass3.id
  })
booking2.save()

booking3 = Booking.new({
  'member_id' => member2.id,
  'gym_class_id' => gymclass2.id
  })
booking3.save()

booking4 = Booking.new({
  'member_id' => member3.id,
  'gym_class_id' => gymclass3.id
  })
booking4.save()

booking5 = Booking.new({
  'member_id' => member1.id,
  'gym_class_id' => gymclass4.id
  })
booking5.save()

booking6 = Booking.new({
  'member_id' => member4.id,
  'gym_class_id' => gymclass1.id
  })
booking6.save()

booking7 = Booking.new({
  'member_id' => member2.id,
  'gym_class_id' => gymclass3.id
  })
booking7.save()

binding.pry
nil
