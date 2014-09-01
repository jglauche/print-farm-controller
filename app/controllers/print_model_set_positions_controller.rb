    class PrintModelSetPositionsController < ApplicationController
  # GET /print_model_set_positions
  # GET /print_model_set_positions.xml
  def index
    @print_model_set_positions = PrintModelSetPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_model_set_positions }
    end
  end

  # GET /print_model_set_positions/1
  # GET /print_model_set_positions/1.xml
  def show
    @print_model_set_position = PrintModelSetPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @print_model_set_position }
    end
  end

  # GET /print_model_set_positions/new
  # GET /print_model_set_positions/new.xml
  def new
    @print_model_set_position = PrintModelSetPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_model_set_position }
    end
  end

  
  def new_link
    
    @print_model = PrintModel.find(params[:id].to_i)
    if params[:print_model_set_id] 
        PrintModelSetPosition.create(
           :print_model_set_id => params[:print_model_set_id].to_i, 
           :print_model_id => @print_model.id,
           :quantity => 1
           )
        
        redirect_to("/print_model_sets/"+params[:print_model_set_id].to_i.to_s)
        return
    end
    
    
    @print_model_sets = PrintModelSet.all
    
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /print_model_set_positions/1/edit
  def edit
    @print_model_set_position = PrintModelSetPosition.find(params[:id])
  end

  # POST /print_model_set_positions
  # POST /print_model_set_positions.xml
  def create
    @print_model_set_position = PrintModelSetPosition.new(params[:print_model_set_position])

    respond_to do |format|
      if @print_model_set_position.save
        format.html { redirect_to(@print_model_set_position, :notice => 'Print model set position was successfully created.') }
        format.xml  { render :xml => @print_model_set_position, :status => :created, :location => @print_model_set_position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_model_set_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_model_set_positions/1
  # PUT /print_model_set_positions/1.xml
  def update
    @print_model_set_position = PrintModelSetPosition.find(params[:id])

    respond_to do |format|
      if @print_model_set_position.update_attributes(params[:print_model_set_position])
        format.html { redirect_to(@print_model_set_position, :notice => 'Print model set position was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_model_set_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_model_set_positions/1
  # DELETE /print_model_set_positions/1.xml
  def destroy
    @print_model_set_position = PrintModelSetPosition.find(params[:id])
    @print_model_set_position.destroy

    respond_to do |format|
      format.html { redirect_to(@print_model_set_position.print_model_set) }
      format.xml  { head :ok }
    end
  end
end
