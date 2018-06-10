require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/member')

class TestMember < MiniTest::Test

  def setup
     @member1 = Member.new("Angelina", "Blyth", "Basic")
  end

  def test_check_win
  assert_equal('rock wins!', @game1.check_win('rock', 'scissor'))
  end
