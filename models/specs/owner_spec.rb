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
      "name" => "Sarah Colins"
      })
  end

  def test_adopt()
    @owner1.adopt(@pet1)
    actual = @pet1.status()
    expected = "Adopted"
    assert_equal(expected, actual)
  end

end
