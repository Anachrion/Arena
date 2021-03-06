require "application_system_test_case"

class FightersTest < ApplicationSystemTestCase
  setup do
    @fighter = fighters(:one)
  end

  test "visiting the index" do
    visit fighters_url
    assert_selector "h1", text: "Fighters"
  end

  test "creating a Fighter" do
    visit fighters_url
    click_on "New Fighter"

    fill_in "Description", with: @fighter.description
    fill_in "Hit points", with: @fighter.hit_points
    fill_in "Name", with: @fighter.name
    fill_in "Precision", with: @fighter.precision
    fill_in "Strength", with: @fighter.strength
    click_on "Create Fighter"

    assert_text "Fighter was successfully created"
    click_on "Back"
  end

  test "updating a Fighter" do
    visit fighters_url
    click_on "Edit", match: :first

    fill_in "Description", with: @fighter.description
    fill_in "Hit points", with: @fighter.hit_points
    fill_in "Name", with: @fighter.name
    fill_in "Precision", with: @fighter.precision
    fill_in "Strength", with: @fighter.strength
    click_on "Update Fighter"

    assert_text "Fighter was successfully updated"
    click_on "Back"
  end

  test "destroying a Fighter" do
    visit fighters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fighter was successfully destroyed"
  end
end
