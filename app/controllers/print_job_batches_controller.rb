class PrintJobBatchesController < ApplicationController
  # GET /print_job_batches
  # GET /print_job_batches.xml
  def index
    @print_job_batches = PrintJobBatch.order("priority desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @print_job_batches }
    end
  end

  # GET /print_job_batches/1
  # GET /print_job_batches/1.xml
  def show
    @print_job_batch = PrintJobBatch.find(params[:id])
    @print_jobs = @print_job_batch.print_jobs
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @print_job_batch }
    end
  end

  # GET /print_job_batches/new
  # GET /print_job_batches/new.xml
  def new
    @print_job_batch = PrintJobBatch.new(params[:print_job_batch])
    @print_job_batch.priority=10

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @print_job_batch }
    end
  end

  # GET /print_job_batches/1/edit
  def edit
    @print_job_batch = PrintJobBatch.find(params[:id])
  end

  # POST /print_job_batches
  # POST /print_job_batches.xml
  def create
    @print_job_batch = PrintJobBatch.new(params[:print_job_batch])

    respond_to do |format|
      if @print_job_batch.save
        format.html { redirect_to(@print_job_batch, :notice => 'Print job batch was successfully created.') }
        format.xml  { render :xml => @print_job_batch, :status => :created, :location => @print_job_batch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @print_job_batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /print_job_batches/1
  # PUT /print_job_batches/1.xml
  def update
    @print_job_batch = PrintJobBatch.find(params[:id])

    respond_to do |format|
      if @print_job_batch.update_attributes(params[:print_job_batch])
        format.html { redirect_to(@print_job_batch, :notice => 'Print job batch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @print_job_batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /print_job_batches/1
  # DELETE /print_job_batches/1.xml
  def destroy
    @print_job_batch = PrintJobBatch.find(params[:id])
    @print_job_batch.destroy

    respond_to do |format|
      format.html { redirect_to(print_job_batches_url) }
      format.xml  { head :ok }
    end
  end
end
