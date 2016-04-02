require 'test_helper'

class CarsTodoListsControllerTest < ActionController::TestCase
  setup do
    @cars_todo_list = cars_todo_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cars_todo_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cars_todo_list" do
    assert_difference('CarsTodoList.count') do
      post :create, cars_todo_list: { car_owner_email: @cars_todo_list.car_owner_email, car_plate_number: @cars_todo_list.car_plate_number, pickedup_at: @cars_todo_list.pickedup_at, ready_for_pick_up_at: @cars_todo_list.ready_for_pick_up_at }
    end

    assert_redirected_to cars_todo_list_path(assigns(:cars_todo_list))
  end

  test "should show cars_todo_list" do
    get :show, id: @cars_todo_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cars_todo_list
    assert_response :success
  end

  test "should update cars_todo_list" do
    patch :update, id: @cars_todo_list, cars_todo_list: { car_owner_email: @cars_todo_list.car_owner_email, car_plate_number: @cars_todo_list.car_plate_number, pickedup_at: @cars_todo_list.pickedup_at, ready_for_pick_up_at: @cars_todo_list.ready_for_pick_up_at }
    assert_redirected_to cars_todo_list_path(assigns(:cars_todo_list))
  end

  test "should destroy cars_todo_list" do
    assert_difference('CarsTodoList.count', -1) do
      delete :destroy, id: @cars_todo_list
    end

    assert_redirected_to cars_todo_lists_path
  end
end
