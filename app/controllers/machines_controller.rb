class MachinesController < ApplicationController
  # GET /machines
  # GET /machines.xml
  def index
    @machines = Machine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @machines }
    end
  end

  # GET /machines/1
  # GET /machines/1.xml
  def show
   

    respond_to do |format|
      format.html{
        @machine = Machine.find(params[:id])
      }
      format.json  { 
         if params[:id].to_i > 0
           # state abfrage
           @machine = Machine.find(params[:id])
           if @machine.state == Machine::Idle
             render :text => 1             
           else 
             render :nothing => true
           end
           
           return
         end
        
         @machine = Machine.find_by_uuid(params[:uuid])    
         if @machine == nil
            if params[:uuid] == nil or params[:uuid] == "00000000-0000-0000-0000-000000000000"
               render :text => "-1"
               return                            
           end
           @machine = Machine.create(:nick => "New Printer", :uuid => params[:uuid])
           
         end
        render :text => @machine.id
      
      }
    end
  end

  # GET /machines/new
  # GET /machines/new.xml
  def new
    @machine = Machine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @machine = Machine.find(params[:id])
  end

  # POST /machines
  # POST /machines.xml
  def create
    @machine = Machine.new(params[:machine])

    respond_to do |format|
      if @machine.save
        format.html { redirect_to(@machine, :notice => 'Machine was successfully created.') }
        format.xml  { render :xml => @machine, :status => :created, :location => @machine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /machines/1
  # PUT /machines/1.xml
  def update
    @machine = Machine.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:machine])
        format.html { redirect_to(@machine, :notice => 'Machine was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.xml
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to(machines_url) }
      format.xml  { head :ok }
    end
  end
end
