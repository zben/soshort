require 'test_helper'

class UrlMapTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UrlMap.new.valid?
  end
end
