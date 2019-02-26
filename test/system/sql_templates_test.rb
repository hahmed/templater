require "application_system_test_case"

class SqlTemplatesTest < ApplicationSystemTestCase
  setup do
    @sql_template = sql_templates(:one)
  end

  test "visiting the index" do
    visit sql_templates_url
    assert_selector "h1", text: "Sql Templates"
  end

  test "creating a Sql template" do
    visit sql_templates_url
    click_on "New Sql Template"

    fill_in "Body", with: @sql_template.body
    fill_in "Format", with: @sql_template.format
    fill_in "Handler", with: @sql_template.handler
    fill_in "Locale", with: @sql_template.locale
    check "Partial" if @sql_template.partial
    fill_in "Path", with: @sql_template.path
    click_on "Create Sql template"

    assert_text "Sql template was successfully created"
    click_on "Back"
  end

  test "updating a Sql template" do
    visit sql_templates_url
    click_on "Edit", match: :first

    fill_in "Body", with: @sql_template.body
    fill_in "Format", with: @sql_template.format
    fill_in "Handler", with: @sql_template.handler
    fill_in "Locale", with: @sql_template.locale
    check "Partial" if @sql_template.partial
    fill_in "Path", with: @sql_template.path
    click_on "Update Sql template"

    assert_text "Sql template was successfully updated"
    click_on "Back"
  end

  test "destroying a Sql template" do
    visit sql_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sql template was successfully destroyed"
  end
end
