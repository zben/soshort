require 'spec_helper'

describe Tag do
  before do
    Tag.create(:name=>"internet")
    Tag.create(:name=>"interesting")
    Tag.create(:name=>"exciting")
  end

  it 'finds matching tags given a string' do
    Tag.json_filter("int").count.should == 2
    Tag.json_filter("ing").count.should == 2
    Tag.json_filter("%ing%").count.should == 2
  end
    
end
