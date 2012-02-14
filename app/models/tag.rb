class Tag < ActiveRecord::Base

  has_and_belongs_to_many :url_maps
  
  def self.json_filter string
    escaped_query =  string.gsub ('%', '\%').gsub ('_', '\_')
    find(:all,:conditions=>["name like ?", "%#{escaped_query}%"]).map{|x| {:id=>x.id,:name=>x.name}}
  end
end


