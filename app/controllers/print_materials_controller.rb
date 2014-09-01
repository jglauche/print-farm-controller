class PrintMaterialsController < ApplicationController
  # GET /print_materials
  # GET /print_materials.xml
  def index
    @print_materials = PrintMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_materials }
    end
  end

  # GET /print_materials/1
  # GET /print_materials/1.xml
  def show
    @print_material = PrintMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @print_material }
    end
  end

  # GET /print_materials/new
  # GET /print_materials/new.xml
  def new
    @print_material = PrintMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_material }
    end
  end

  # GET /print_materials/1/edit
  def edit
    @print_material = PrintMaterial.find(params[:id])
  end

  # POST /print_materials
  # POST /print_materials.xml
  def create
    @print_material = PrintMaterial.new(params[:print_material])

    respond_to do |format|
      if @print_material.save
        format.html { redirect_to(@print_material, :notice => 'Print material was successfully created.') }
        format.xml  { render :xml => @print_material, :status => :created, :location => @print_material }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_material.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_materials/1
  # PUT /print_materials/1.xml
  def update
    @print_material = PrintMaterial.find(params[:id])

    respond_to do |format|
      if @print_material.update_attributes(params[:print_material])
        format.html { redirect_to(@print_material, :notice => 'Print material was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_material.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_materials/1
  # DELETE /print_materials/1.xml
  def destroy
    @print_material = PrintMaterial.find(params[:id])
    @print_material.update_attributes :is_deleted => 1

    respond_to do |format|
      format.html { redirect_to(print_materials_url) }
      format.xml  { head :ok }
    end
  end
end
