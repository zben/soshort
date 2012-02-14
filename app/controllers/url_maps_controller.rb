class UrlMapsController < ApplicationController
  def index
    @url_map = UrlMap.new
    @url_maps = UrlMap.all(:order => "created_at desc")
  end

  def show
    @url_map = UrlMap.find(params[:id])
  end

  def new
    @url_map = UrlMap.new
  end

  def create
    @url_map = UrlMap.new(params[:url_map])
    result = UrlMap.validation_result(params[:url_map][:short_url])
    if result!="available"
      flash[:error]=result
      render :action=>'new' 
    else  
      @url_map.short_url=UrlMap.random_unique_string(6) if params[:url_map][:short_url].empty?
      if (params[:url_map][:long_url]=~ URI::regexp) != 0
        flash[:error]="Original URL is not valid."
        render :action=>'new'
      elsif @url_map.save
        @url_map.update_tags params
        flash[:notice] = "Successfully created url map."
        redirect_to @url_map
      else
        render :action => 'new'
      end
    end
  end
  
  def edit
      @url_map = UrlMap.find(params[:id])
  end
  
  def update
    @url_map = UrlMap.find(params[:id])  
    result = UrlMap.validation_result(params[:url_map][:short_url],params[:id])
    if result!="available"
      flash[:error]=result
      render :action=>'new' 
    else
      params[:url_map][:short_url] =UrlMap.random_unique_string(6) if params[:url_map][:short_url].empty?
      if (params[:url_map][:long_url]=~ URI::regexp) != 0
        flash[:error]="Original URL is not valid."
        render :action=>'new'
      elsif @url_map.update_attributes(params[:url_map])
         @url_map.update_tags params
         flash[:notice] = "Successfully updated short URL."
         redirect_to @url_map
      else
        render :action => 'new'
      end
    end
  end
  
  def destroy
    @url_map = UrlMap.find(params[:id])
    @url_map.destroy
    flash[:notice] = "Successfully destroyed url map."
    redirect_to url_maps_url
  end
  
  def tag_list
    render :json=>Tag.json_filter(params[:q])
  end
  
  def check_url
    render :json=>UrlMap.validation_result(params[:q],params[:id]).to_json
  end

  def redirect
    redirect_to UrlMap.find(:all,:conditions=>{:short_url=>params[:short_url]})[0].long_url
  end
end
