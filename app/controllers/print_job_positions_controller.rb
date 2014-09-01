class PrintJobPositionsController < ApplicationController
  # GET /print_job_positions
  # GET /print_job_positions.xml
  def index
    @print_job_positions = PrintJobPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_job_positions }
    end
  end

  # GET /print_job_positions/1
  # GET /print_job_positions/1.xml
  def show


    respond_to do |format|
      format.html {    @print_job_position = PrintJobPosition.find(params[:id])}
      format.json{
        pp = PrintJobPosition.where(:machine_id => params[:id].to_i).first
        if params[:percent]
          pp.update_attributes :percent_done => params[:percent].to_f
          render :nothing => true
          return          
        end
                
        # todo save printing time
        state = params[:state].to_i
        
        if state == 2 # success
          pp.status = PrintJobPosition::Done
        end
        
        if state == 3 # Fail
          pp.status = PrintJobPosition::Fail
        end
        pp.machine.update_attributes :state => Machine::WaitForReactivation
        if pp.machine.resets_automatically.to_i == 1
            pp.done(pp.quantity)
        end
        pp.save
        render :nothing => true
      }
    end
  end

  # GET /print_job_positions/new
  # GET /print_job_positions/new.xml
  def new
    @print_job_position = PrintJobPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_job_position }
    end
  end


  # GET /print_job_positions/1/edit
  def edit
    @print_job_position = PrintJobPosition.find(params[:id])
  end

  # POST /print_job_positions
  # POST /print_job_positions.xml
  def create
    @print_job_position = PrintJobPosition.new(params[:print_job_position])

    respond_to do |format|
      if @print_job_position.save
        format.html { redirect_to(@print_job_position, :notice => 'Print job position was successfully created.') }
        format.xml  { render :xml => @print_job_position, :status => :created, :location => @print_job_position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_job_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_job_positions/1
  # PUT /print_job_positions/1.xml
  def update
    @print_job_position = PrintJobPosition.find(params[:id])

    @print_job_position.done(params[:print_job_position][:quantity].to_i)

    respond_to do |format|
     format.html { redirect_to(:action => :index) }
     format.xml  { head :ok }
     
    end
  end

  # DELETE /print_job_positions/1
  # DELETE /print_job_positions/1.xml
  def destroy
    @print_job_position = PrintJobPosition.find(params[:id])
    @print_job_position.destroy

    respond_to do |format|
      format.html { redirect_to(print_job_positions_url) }
      format.xml  { head :ok }
    end
  end
end
