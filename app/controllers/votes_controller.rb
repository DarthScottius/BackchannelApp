class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new 
      #Vote.addvote params[:postid] , params[:votetype]
      postid = params[:postid]
      if params[:votetype] == 2.to_s
        #Post.addvote params[:postid]
        r = Reply.find(postid)
       val = r.read_attribute(:numvotes)
         if val.nil?  
            val  = 0
         else
           val = val+1
         end
         r.update_attributes(:numvotes => val)
         else
            r = Post.find(postid)
            val = r.read_attribute(:weight)
            if( val.nil? )
                val = 0;
            else
            val  = val +1;
            end
           r.update_attributes(:weight => val)
           end
        #Reply.addvote params[:postid]
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Your vote was successfuly saved' }
      #format.html # new.html.erb
      #format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :ok }
    end
  end
end
