require "test_helper"

class DroneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save drone without SN" do
    drone = Drone.new
    assert_not drone.save
  end

end
