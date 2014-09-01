class ContainerItemsController < ApplicationController
  # GET /container_items
  # GET /container_items.xml
  def index
    @container_items = ContainerItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @container_items }
    end
  end

  # GET /container_items/1
  # GET /container_items/1.xml
  def show
    @container_item = ContainerItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @container_item }
    end
  end

  # GET /container_items/new
  # GET /container_items/new.xml
  def new
    @container_item = ContainerItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @container_item }
    end
  end

  # GET /container_items/1/edit
  def edit
    @container_item = ContainerItem.find(params[:id])
  end

  # POST /container_items
  # POST /container_items.xml
  def create
    @container_item = ContainerItem.new(params[:container_item])

    respond_to do |format|
      if @container_item.save
        format.html { redirect_to(@container_item, :notice => 'Container item was successfully created.') }
        format.xml  { render :xml => @container_item, :status => :created, :location => @container_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @container_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /container_items/1
  # PUT /container_items/1.xml
  def update
    @container_item = ContainerItem.find(params[:id])

    respond_to do |format|
      if @container_item.update_attributes(params[:container_item])
        format.html { redirect_to(@container_item, :notice => 'Container item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @container_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /container_items/1
  # DELETE /container_items/1.xml
  def destroy
    @container_item = ContainerItem.find(params[:id])
    @container_item.destroy

    respond_to do |format|
      format.html { redirect_to(container_items_url) }
      format.xml  { head :ok }
    end
  end
end
