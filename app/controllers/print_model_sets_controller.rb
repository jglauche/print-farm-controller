class PrintModelSetsController < ApplicationController
  # GET /print_model_sets
  # GET /print_model_sets.xml
  def index
    @print_model_sets = PrintModelSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_model_sets }
    end
  end

  # GET /print_model_sets/1
  # GET /print_model_sets/1.xml
  def show
    @print_model_set = PrintModelSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @print_model_set }
    end
  end

  # GET /print_model_sets/new
  # GET /print_model_sets/new.xml
  def new
    @print_model_set = PrintModelSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_model_set }
    end
  end

  # GET /print_model_sets/1/edit
  def edit
    @print_model_set = PrintModelSet.find(params[:id])
  end

  # POST /print_model_sets
  # POST /print_model_sets.xml
  def create
    @print_model_set = PrintModelSet.new(params[:print_model_set])

    respond_to do |format|
      if @print_model_set.save
        format.html { redirect_to(@print_model_set, :notice => 'Print model set was successfully created.') }
        format.xml  { render :xml => @print_model_set, :status => :created, :location => @print_model_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_model_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_model_sets/1
  # PUT /print_model_sets/1.xml
  def update
    @print_model_set = PrintModelSet.find(params[:id])

    respond_to do |format|
      if @print_model_set.update_attributes(params[:print_model_set])
        format.html { redirect_to(@print_model_set, :notice => 'Print model set was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_model_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_model_sets/1
  # DELETE /print_model_sets/1.xml
  def destroy
    @print_model_set = PrintModelSet.find(params[:id])
    @print_model_set.destroy

    respond_to do |format|
      format.html { redirect_to(print_model_sets_url) }
      format.xml  { head :ok }
    end
  end
end
