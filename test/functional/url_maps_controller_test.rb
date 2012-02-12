require 'test_helper'

class UrlMapsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UrlMap.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UrlMap.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UrlMap.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to url_map_url(assigns(:url_map))
  end

  def test_destroy
    url_map = UrlMap.first
    delete :destroy, :id => url_map
    assert_redirected_to url_maps_url
    assert !UrlMap.exists?(url_map.id)
  end
end
