class LinksController < ApplicationController
  layout 'site'

  # GET /links
  # GET /links.xml
  def index
    @links = Links.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @link = Links.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/new
  # GET /links/new.xml
  def new
    if (Conf.maintainence)
      @link = Links.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @link }
      end
    else
      render '404', :status => 404
    end
  end

  # GET /links/1/edit
  def edit
    if (Conf.maintainence)
      @link = Links.find(params[:id])
    else
      render '404', :status => 404
    end
  end 

  # POST /links
  # POST /links.xml
  def create
    if (Conf.maintainence)
      @link = Links.new(params[:links])
  
      respond_to do |format|
        if @link.save
          format.html { redirect_to(@link, :notice => 'Link was successfully created.') }
          format.xml  { render :xml => @link, :status => :created, :location => @link }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
        end
      end
    else
      render '404', :status => 404
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    if (Conf.maintainence)
      @link = Links.find(params[:id])
  
      respond_to do |format|
        p @link
        p params
        if @link.update_attributes(params[:links])
          format.html { redirect_to(@link, :notice => 'Link was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
        end
      end
    else
      render '404', :status => 404
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    if (Conf.maintainence)
      @link = Links.find(params[:id])
      @link.destroy
  
      respond_to do |format|
        format.html { redirect_to(links_url) }
        format.xml  { head :ok }
      end
    else
      render '404', :status => 404
    end
  end
end
