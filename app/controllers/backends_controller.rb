class BackendsController < ApplicationController
  # GET /backends
  # GET /backends.xml
  def index
    @backends = Backend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backends }
    end
  end

  # GET /backends/1
  # GET /backends/1.xml
  def show
    @backend = Backend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @backend }
    end
  end

  # GET /backends/new
  # GET /backends/new.xml
  def new
    @backend = Backend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @backend }
    end
  end

  # GET /backends/1/edit
  def edit
    @backend = Backend.find(params[:id])
  end

  # POST /backends
  # POST /backends.xml
  def create
    @backend = Backend.new(params[:backend])

    respond_to do |format|
      if @backend.save
        format.html { redirect_to(@backend, :notice => 'Backend was successfully created.') }
        format.xml  { render :xml => @backend, :status => :created, :location => @backend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /backends/1
  # PUT /backends/1.xml
  def update
    @backend = Backend.find(params[:id])

    respond_to do |format|
      if @backend.update_attributes(params[:backend])
        format.html { redirect_to(@backend, :notice => 'Backend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /backends/1
  # DELETE /backends/1.xml
  def destroy
    @backend = Backend.find(params[:id])
    @backend.destroy

    respond_to do |format|
      format.html { redirect_to(backends_url) }
      format.xml  { head :ok }
    end
  end
end
