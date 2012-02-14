require 'spec_helper'

describe UrlMap do
  before do
    @url_map = UrlMap.new(:short_url=>"short", :long_url=>"http://google.com")
  end

  it 'is valid with valid attributes' do
    @url_map = UrlMap.new(:short_url=>"short", :long_url=>"http://google.com")
    @url_map.save.should be_true
  end
  
  it 'is not valid without short url' do
    @url_map = UrlMap.new(:long_url=>"http://google.com")
    @url_map.save.should raise_error
  end
  
  it 'is not valid without long url' do
    @url_map = UrlMap.new(:short_url=>"google")
    @url_map.save.should raise_error
  end

  describe 'validate short_url' do
    before do
      @url_map = UrlMap.create(:short_url=>"test", :long_url=>"http://google.com")
    end
     
    it 'is not valid when given repeated url' do
      UrlMap.validation_result("test").should == "this short url is already taken"
    end 
    
    it 'is not valid when given names that are reserved words' do
      UrlMap.validation_result("url_maps").should == "this short url is already taken"
      UrlMap.validation_result("tags").should == "this short url is already taken"
      UrlMap.validation_result("check_url").should == "this short url is already taken"
    end
    
    it 'is not valid when giving unsupported string' do
      UrlMap.validation_result("%asdff").should == 'Only support letters, numbers,underscore and dash'
      UrlMap.validation_result("fads asdfads").should == 'Only support letters, numbers,underscore and dash'
      UrlMap.validation_result("dfdf.dfd").should == 'Only support letters, numbers,underscore and dash'
    end
    
    it 'is valid when giving proper input' do
      UrlMap.validation_result("abd_dfd-dfd").should == 'available'
    end
  end
  
  describe 'random string generation' do
    it 'generates different string every time' do
      UrlMap.random_unique_string.should_not == UrlMap.random_unique_string 
    end
  end
  
  describe 'updating of url_map tags' do
    it 'insert the right number of tags when given both types of tags' do
      id1=Tag.create(:name=>'test1').id
      id2=Tag.create(:name=>'test2').id
      params={:as_values_tags=>"#{id1},#{id2}",:tags=>'test1'}
      @url_map.update_tags(params)
      @url_map.should have(3).tags
    end
    it 'insert the right number of tags with just index tags' do
      id1=Tag.create(:name=>'test1').id
      id2=Tag.create(:name=>'test2').id
      params={:as_values_tags=>"#{id1},#{id2}"}
      @url_map.update_tags(params)
      @url_map.should have(2).tags
    end
  end
  
end
