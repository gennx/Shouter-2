class ShoutsController < ApplicationController
  # GET /shouts
  # GET /shouts.json
  def index
    
    if params[:from] == "following"
      @follows_ids = current_user.follows.collect {|row| row.follow_id}
      @shouts = Shout.where(:user_id => @follows_ids).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    else
      @shouts = Shout.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shouts }
    end
  end

  # GET /shouts/1
  # GET /shouts/1.json
  def show
    @shout = Shout.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shout }
    end
  end

  # GET /shouts/new
  # GET /shouts/new.json
  def new
    @shout = Shout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shout }
    end
  end

  # GET /shouts/1/edit
  def edit
    @shout = Shout.find(params[:id])
  end

  # POST /shouts
  # POST /shouts.json
  def create
    @shout = Shout.new(params[:shout])
    @shout.user_id = current_user.id

    respond_to do |format|
      if @shout.save
        format.html { redirect_to @shout, notice: 'Shout was successfully created.' }
        format.json { render json: @shout, status: :created, location: @shout }
      else
        format.html { render action: "new" }
        format.json { render json: @shout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shouts/1
  # PUT /shouts/1.json
  def update
    @shout = Shout.find(params[:id])

    respond_to do |format|
      if @shout.update_attributes(params[:shout])
        format.html { redirect_to @shout, notice: 'Shout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shouts/1
  # DELETE /shouts/1.json
  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy

    respond_to do |format|
      format.html { redirect_to shouts_url }
      format.json { head :no_content }
    end
  end
end
