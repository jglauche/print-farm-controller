class PrintJobsController < ApplicationController
  # GET /print_jobs
  # GET /print_jobs.xml
  def index
    @print_jobs = PrintJob.open

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_jobs }
    end
  end

  # GET /print_jobs/1
  # GET /print_jobs/1.xml
  def show

    respond_to do |format|
      format.html {    
        @print_job = PrintJob.find(params[:id])

      }
#      format.xml  { render :xml => @print_job }
      format.json{
        # machine ask for job
        m = Machine.find(params[:id])
        
              
        if m.print_material_id.to_i == 0 or m.status != Machine::Operational
          render(:nothing => true)
          return          
        end

        pos = PrintJobPosition.where(:machine_id => m.id).first
        
        if pos == nil 
          # finding a new job
          
          job = PrintJobBatch.find_next_job(m)
          
          if job == nil
              if m.print_job_batch_id.to_i > 0
                 PrintJobBatch.find(m.print_job_batch_id).check_if_completed
              end
              new_batch = PrintJobBatch.find_new_batch_for_machine(m)
              
              if new_batch
                m.update_attributes :print_job_batch_id => new_batch.id
                job = PrintJobBatch.find_next_job(m)                        
              end
       
          end
          
          
          
          #job = PrintJob.open.where(:material_id => m.print_material.material_id, :nozzle_size => m.nozzle_size).order("priority desc").first
          if job == nil
            render(:nothing => true)
            return
          end
          
         
          quantity= job.find_out_quantity(m)
          #quantity = quantity_x*quantity_y
          # TODO check this

          
          
          
          pos = PrintJobPosition.create(:print_job_id => job.id,
                                        :machine_id => m.id,
                                        :quantity => quantity,
                                        :status => PrintJobPosition::New)
         job.quantity_printing += quantity
         job.save
         s = Slic3r.new
         s.slice(pos)
       end
       
       gcode = pos.gcode
      
       if gcode != nil
         if m.has_enough_filament?(pos.filament_used_in_kg)
             pos.status = PrintJobPosition::Printing
             pos.save
         else
            render(:nothing => true)
            return            
         end
       end
       
       
       # todo checksum
       render(:text => {:print_job_position_id => pos.id, :gcode => gcode}.to_json)
      
      }
    end
  end

  # GET /print_jobs/new
  # GET /print_jobs/new.xml
  def new
    @print_job = PrintJob.new(:print_model_id => params[:print_model_id],
                              :quantity => 1,
                              :priority => 1,
                              :status => PrintJob::New
      
    )
    @print_model = PrintModel.find(params[:print_model_id])


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_job }
    end
  end

  # GET /print_jobs/1/edit
  def edit
    @print_job = PrintJob.find(params[:id])
  end

  # POST /print_jobs
  # POST /print_jobs.xml
  def create
    @print_job = PrintJob.new(params[:print_job])
		@print_model = PrintModel.find(@print_job.print_model_id)	
		
	
		p = PrintModelSet.create(:name => @print_model.filename, :temporary => 1)
		
    PrintModelSetPosition.create(
       :print_model_set_id => p.id, 
       :print_model_id => @print_model.id,
       :quantity =>  @print_job.quantity
       )
    
		@print_job_batch = PrintJobBatch.create(:print_model_set_id => p.id, 
														 :plastic_type => @print_job.plastic_type,
														 :material_id => @print_job.material_id,
														 :machine_id => @print_job.machine_id,
														 :container_id => @print_job.container_id,	
														 :priority => @print_job.priority,
														 :backend_id => @print_job.backend_id)



    respond_to do |format|
      if @print_job_batch.save
        format.html { redirect_to(@print_job_batch, :notice => 'Print job was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /print_jobs/1
  # PUT /print_jobs/1.xml
  def update
    @print_job = PrintJob.find(params[:id])

    respond_to do |format|
      if @print_job.update_attributes(params[:print_job])
        format.html { redirect_to(@print_job, :notice => 'Print job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_jobs/1
  # DELETE /print_jobs/1.xml
  def destroy
    @print_job = PrintJob.find(params[:id])
    @print_job.destroy

    respond_to do |format|
      format.html { redirect_to(print_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
