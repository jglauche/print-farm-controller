class PrintModelsController < ApplicationController
  # GET /print_models
  # GET /print_models.xml
  def index
    @print_models = PrintModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_models }
    end
  end

  # GET /print_models/1
  # GET /print_models/1.xml
  def show
    @print_model = PrintModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @print_model }
    end
  end

  # GET /print_models/new
  # GET /print_models/new.xml
  def new
    @print_model = PrintModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_model }
    end
  end

  # GET /print_models/1/edit
  def edit
    @print_model = PrintModel.find(params[:id])
  end

  # POST /print_models
  # POST /print_models.xml
  def create
    @print_model = PrintModel.new(params[:print_model])

    respond_to do |format|
      if @print_model.save
        format.html { redirect_to(@print_model, :notice => 'Print model was successfully created.') }
        format.xml  { render :xml => @print_model, :status => :created, :location => @print_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_models/1
  # PUT /print_models/1.xml
  def update
    @print_model = PrintModel.find(params[:id])

    respond_to do |format|
      if @print_model.update_attributes(params[:print_model])
        format.html { redirect_to(@print_model, :notice => 'Print model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_models/1
  # DELETE /print_models/1.xml
  def destroy
    @print_model = PrintModel.find(params[:id])
    @print_model.destroy

    respond_to do |format|
      format.html { redirect_to(print_models_url) }
      format.xml  { head :ok }
    end
  end
end
