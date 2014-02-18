require 'test_helper'

class UserTest < Capybara::Rails::TestCase

  def test_user_can_visit_index
    visit root_path
    assert_content page, "Welcome"
  end

  def test_user_can_fill_out_form
    visit root_path

    choose "type_cat"
    fill_in "pet_name", with: "Beatrix"
    fill_in "pet_description", with: "Long haired calico cat last seen lurking around building 19"
    fill_in "pet_zip", with: 80027

    click_on "Submit info"
  end

  def test_user_can
  end

end