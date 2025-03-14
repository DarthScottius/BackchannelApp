class RepliesController < ApplicationController
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.json
  def new
    begin
      @post = Post.find(params[:post_id])
      @user = current_user
    rescue ActiveRecord::RecordNotFound
      logger.error "Accessed invalid post #{params[:post_id]}"
      redirect_to posts_path, :notice => 'Invalid post id'
    else
       @reply = @user.replies.build
       @reply.user_id = @user.id
       @reply.post_id = @post.id
    end
    @post.save
    @reply.save
    respond_to do |format|
      format.html { redirect_to edit_reply_path(@reply), notice: @post.title }
      format.json { render json: @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(params[:reply])

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was successfully created.' }
        format.json { render json: @reply, status: :created, location: @reply }
      else
        format.html { render action: "new" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.json
  def update
    @reply = Reply.find(params[:id])
    @post = @reply.post
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @post , notice: 'Reply added' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    @post = @reply.post

    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :ok }
    end
  end
end
