require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/gym_class')

class TestGymClass < MiniTest::Test

  def setup
    @gymclass1 = GymClass.new({
      'title' => 'Boxing',
      'description' => 'Description',
      'teacher' => 'Meg Smith',
      'cost' => '5',
      'duration' => '60'
      })
    end

  def test_class_has_title
    assert_equal("Boxing", @gymclass1.title)
  end

  def test_class_has_description
    assert_equal("Description", @gymclass1.description)
  end

  def test_class_has_teacher
    assert_equal("Meg Smith", @gymclass1.teacher)
  end

  def test_class_has_cost
    assert_equal(5, @gymclass1.cost)
  end

  def test_class_has_duration
    assert_equal(60 , @gymclass1.duration)
  end



end
