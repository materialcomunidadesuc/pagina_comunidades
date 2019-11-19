require 'test_helper'

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template = templates(:one)
  end

  test "should get index" do
    get templates_url
    assert_response :success
  end

  test "should get new" do
    get new_template_url
    assert_response :success
  end

  test "should create template" do
    assert_difference('Template.count') do
      post templates_url, params: { template: { activities: @template.activities, annexed: @template.annexed, calendar: @template.calendar, final_day: @template.final_day, final_month: @template.final_month, final_prayer: @template.final_prayer, final_year: @template.final_year, friday_gospel: @template.friday_gospel, friday_saints: @template.friday_saints, gospel: @template.gospel, initial_day: @template.initial_day, initial_month: @template.initial_month, initial_prayer: @template.initial_prayer, initial_year: @template.initial_year, monday_gospel: @template.monday_gospel, monday_saints: @template.monday_saints, motivation: @template.motivation, purpose: @template.purpose, saturday_gospel: @template.saturday_gospel, saturday_saints: @template.saturday_saints, structure: @template.structure, sunday_gospel: @template.sunday_gospel, sunday_saints: @template.sunday_saints, thursday_gospel: @template.thursday_gospel, thursday_saints: @template.thursday_saints, tuesday_gospel: @template.tuesday_gospel, tuesday_saints: @template.tuesday_saints, wednesday_gospel: @template.wednesday_gospel, wednesday_saints: @template.wednesday_saints } }
    end

    assert_redirected_to template_url(Template.last)
  end

  test "should show template" do
    get template_url(@template)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_url(@template)
    assert_response :success
  end

  test "should update template" do
    patch template_url(@template), params: { template: { activities: @template.activities, annexed: @template.annexed, calendar: @template.calendar, final_day: @template.final_day, final_month: @template.final_month, final_prayer: @template.final_prayer, final_year: @template.final_year, friday_gospel: @template.friday_gospel, friday_saints: @template.friday_saints, gospel: @template.gospel, initial_day: @template.initial_day, initial_month: @template.initial_month, initial_prayer: @template.initial_prayer, initial_year: @template.initial_year, monday_gospel: @template.monday_gospel, monday_saints: @template.monday_saints, motivation: @template.motivation, purpose: @template.purpose, saturday_gospel: @template.saturday_gospel, saturday_saints: @template.saturday_saints, structure: @template.structure, sunday_gospel: @template.sunday_gospel, sunday_saints: @template.sunday_saints, thursday_gospel: @template.thursday_gospel, thursday_saints: @template.thursday_saints, tuesday_gospel: @template.tuesday_gospel, tuesday_saints: @template.tuesday_saints, wednesday_gospel: @template.wednesday_gospel, wednesday_saints: @template.wednesday_saints } }
    assert_redirected_to template_url(@template)
  end

  test "should destroy template" do
    assert_difference('Template.count', -1) do
      delete template_url(@template)
    end

    assert_redirected_to templates_url
  end
end
