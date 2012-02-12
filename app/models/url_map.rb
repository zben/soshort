class UrlMap < ActiveRecord::Base
  validates_uniqueness_of :short_url
  validates_presence_of :long_url 
  attr_accessible :short_url, :long_url
  
  has_and_belongs_to_many :tags
  
  def self.validation_result(string,id=nil)
    puts string
    puts id
    if string =~ /^[\w-]*$/
      if %w(url_maps check_url tags).include?(string)
        "this short url is already taken"
      else
        result = UrlMap.find(:all,:conditions=>{:short_url=>string})
        (result.empty?||result[0].id==id.to_i) ? "available" : "this short url is already taken"
      end
    else
      'Only support letters, numbers,underscore and dash'
    end
  end
  
  def update_tags params
   self.tags=[]
   (params[:as_values_tags].split(",")+params[:tags].to_a).each do |tag_id|
        if tag_id.to_f!=0
          puts self.tags.count
          self.tags << Tag.find(tag_id) unless tags.include?(Tag.find(tag_id) ) 
          puts self.tags.count
        elsif !tag_id.strip.empty?
          self.tags << Tag.find_or_create_by_name(tag_id)
        end   
   end
   
  end
  
  def self.random_unique_string(size = 6)
    result = false
    while(result == false || self.find(:all,:conditions=>{:short_url=>result})!=[])
      result = ((48..57).to_a+(65..90).to_a+(97..122).to_a).sample(size).map(&:chr).join
    end
    result
  end

end