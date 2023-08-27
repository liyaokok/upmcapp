require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be able to save a user" do
    assert User.create({email: "test@test.com", password:"password", password_confirmation:"password"});
  end

  test "should not save empty email" do
    assert_not User.new({email: "", password:"password", password_confirmation:"password"}).valid?;
  end
end
