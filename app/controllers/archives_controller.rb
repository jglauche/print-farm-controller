class ArchivesController < ApplicationController
  # GET /archives
  # GET /archives.xml
  def index
    @archives = Archive.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @archives }
    end
  end

  # GET /archives/1
  # GET /archives/1.xml
  def show
    @archive = Archive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @archive }
    end
  end

  # GET /archives/new
  # GET /archives/new.xml
  def new
    @archive = Archive.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @archive }
    end
  end

  # GET /archives/1/edit
  def edit
    @archive = Archive.find(params[:id])
  end

  # POST /archives
  # POST /archives.xml
  def create
    @archive = Archive.new(params[:archive])

    respond_to do |format|
      if @archive.save
        format.html { redirect_to(@archive, :notice => 'Archive was successfully created.') }
        format.xml  { render :xml => @archive, :status => :created, :location => @archive }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @archive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /archives/1
  # PUT /archives/1.xml
  def update
    @archive = Archive.find(params[:id])

    respond_to do |format|
      if @archive.update_attributes(params[:archive])
        format.html { redirect_to(@archive, :notice => 'Archive was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @archive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1
  # DELETE /archives/1.xml
  def destroy
    @archive = Archive.find(params[:id])
    @archive.destroy

    respond_to do |format|
      format.html { redirect_to(archives_url) }
      format.xml  { head :ok }
    end
  end
  
  def upload
    @archive = Archive.find(params[:id])
    dir = "files/#{@archive.id}"
    if !File.exists?(dir)
        Dir.mkdir(dir)
    end
    original_filename = params[:upload_archive][:stl_file].original_filename
    filename = dir + "/" + original_filename
    
    FileUtils.cp params[:upload_archive][:stl_file].path, filename
    
    pm = PrintModel.create(:archive_id => @archive.id,:filename => original_filename, :max_x => 1, :max_y => 1)
                
    redirect_to(@archive)
  end
  
end
