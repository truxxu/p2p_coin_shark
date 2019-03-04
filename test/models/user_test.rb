require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Daniel",
                    last_name: "Trujillo",
                    email: "daniel@mail.com",
                    password: "123456",
                    id_type: "Passport",
                    id_number: "123AF2DSFSD34",
                    city: "Paris",
                    address: "16 Villa Gaudelet",
                    photo: "image/upload/v1551461470/hpjnbp9mkcmjihjrxv3e.jpg")
  end

  ID_TYPE = ["Passport", "Driver's License", "Birth Certificate", "Permanent Resident Card"]

  test "should be valid" do
    assert @user.valid?, @user.errors.full_messages
  end

  test "name should be present" do
    @user.first_name = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  test "id_type should be present" do
    @user.id_type = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  test "id_type should be included" do
    assert_includes ID_TYPE, @user.id_type, @user.errors.full_messages
  end

  test "id_number should be present" do
    @user.id_number = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  test "city should be present" do
    @user.city = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  test "address should be present" do
    @user.address = ""
    assert_not @user.valid?, @user.errors.full_messages
  end

  # test "photo should be present" do
  #   @user.photo = ""
  #   assert_not @user.valid?, @user.errors.full_messages
  # end
end
