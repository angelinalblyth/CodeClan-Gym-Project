require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/member')

class TestMember < MiniTest::Test

  def setup
    @member1 = Member.new({
      'first_name' => 'Angelina',
      'last_name' => 'Blyth',
      'membership_type' => 'Basic'
      })
    end

  def test_member_has_first_name
    assert_equal("Angelina", @member1.first_name)
  end

  def test_member_has_last_name
    assert_equal("Blyth", @member1.last_name)
  end

  def test_member_has_membership_type
    assert_equal("Basic", @member1.membership_type)
  end

  

end
