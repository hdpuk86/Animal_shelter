require 'minitest/autorun'
require 'minitest/rg'

require_relative '../pet'

class TestPet < MiniTest::Test

  def test_most_recent()
    actual = Pet.most_recent().name()
    expected = "Rosie"
    assert_equal(expected, actual)
  end

end
