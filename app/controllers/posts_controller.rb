class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
      @posts = Post.all(:order => 'weight DESC' , :limit => '5')  #,:limit => 20
      # @replies = Reply.all(:order => 'numvotes DESC')
      @currentuser = 0
      if params[:search]
          @posts = Post.search(params[:search])
          #if @searchreplies.nil? == false
          #@searchreplies.each { |sr|  var = Post.all(:conditions =>{ :id => sr.post_id })
           #if var.nil? == false
            #    @posts << var
           #end
           #}
       end
      #else
      #@posts.each {|post|
        #  @replies[post.id] = post.replies.find( :conditions => {:post_id => post.id}   )
       # }

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @reply = @post.replies.build
    @post.user_id =  current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_reply_path(@reply), notice: @post.title }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end


end
