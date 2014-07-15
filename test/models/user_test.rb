require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a username" do 
    user = User.new
    assert !user.save
    assert !user.errors[:username].empty?
  end

  test "a user should have a unique username" do
    user = User.new
    user.username = users(:james).username

    assert !user.save
    assert !user.errors[:username].empty?
  end

  test "a user should have a username without spaces" do
    user = User.new(first_name: 'James', last_name: 'Bond', email: 'bond@bookmi6.uk')
    user.password = user.password_confirmation = 'testing123'

    user.username = "My Username with Spaces"

    assert !user.save
    assert !user.errors[:username].empty?
    assert user.errors[:username].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted username" do
    user = User.new(first_name: 'James', last_name: 'Bond', email: 'bond@bookmi6.uk')
    user.password = user.password_confirmation = 'testing123'

    user.username = 'jamesbond'
    assert user.valid?
  end
end
