require 'test_helper'

class ServiceRecordsControllerTest < ActionController::TestCase
  setup do
    @service_record = service_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_record" do
    assert_difference('ServiceRecord.count') do
      post :create, service_record: { car_id: @service_record.car_id, finished_at: @service_record.finished_at }
    end

    assert_redirected_to service_record_path(assigns(:service_record))
  end

  test "should show service_record" do
    get :show, id: @service_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_record
    assert_response :success
  end

  test "should update service_record" do
    patch :update, id: @service_record, service_record: { car_id: @service_record.car_id, finished_at: @service_record.finished_at }
    assert_redirected_to service_record_path(assigns(:service_record))
  end

  test "should destroy service_record" do
    assert_difference('ServiceRecord.count', -1) do
      delete :destroy, id: @service_record
    end

    assert_redirected_to service_records_path
  end
end
