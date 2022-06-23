require "application_system_test_case"

class FacepostsTest < ApplicationSystemTestCase
  setup do
    @facepost = faceposts(:one)
  end

  test "visiting the index" do
    visit faceposts_url
    assert_selector "h1", text: "Faceposts"
  end

  test "creating a Facepost" do
    visit faceposts_url
    click_on "New Facepost"

    fill_in "Post", with: @facepost.post
    click_on "Create Facepost"

    assert_text "Facepost was successfully created"
    click_on "Back"
  end

  test "updating a Facepost" do
    visit faceposts_url
    click_on "Edit", match: :first

    fill_in "Post", with: @facepost.post
    click_on "Update Facepost"

    assert_text "Facepost was successfully updated"
    click_on "Back"
  end

  test "destroying a Facepost" do
    visit faceposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facepost was successfully destroyed"
  end
end
