require 'minitest/autorun'
require 'minitest/rg'

require_relative '../owner'
require_relative '../pet'

class TestOwner < MiniTest::Test

  def setup
    @pet1 = Pet.new({
      "name" => "Rex",
      "type" => "Dog",
      "breed" => "Husky",
      "status" => "Ready",
      "admission_date" => "2017-09-03"
      })
    @owner1 = Owner.new({
      "name" => "Sarah Colins",
      "looking_for" => "Dog"
      })
  end

  def test_adopt()
    @owner1.adopt(@pet1)
    actual1 = @pet1.status()
    expected1 = "Adopted"
    actual2 = @owner1.looking_for()
    expected2 = "None"
    assert_equal(expected1, actual1)
    assert_equal(expected2, actual2)
  end

end
