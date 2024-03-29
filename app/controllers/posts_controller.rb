class PostsController < ApplicationController
    #GET /posts
    #GET /posts.json
    #GET /posts.xml

    def index
        @posts = Post.all

        respond_to do |format|
            format.html #index.html.erb
            format.json { render json: @posts }
            format.xml { render xml: @posts }
        end
    end

    #GET /posts/1
    #GET /posts/1.json
    #GET /posts/1.xml

    def show
        @post = Post.find(params[:id])

        respond_to do |format|
            format.html #index.html.erb
            format.json { render json: @posts }
            format.xml { render xml: @posts }
        end
    end

    #GET /posts/new
    #GET /posts/new.json
    #GET /posts/new.xml

    def new
        @post = Post.new

        respond_to do |format|
            format.html #index.html.erb
            format.json { render json: @posts }
            format.xml { render xml: @posts }
        end
    end
        
    #GET /posts/1/edit
    def edit
        @post = Post.find(params[:id])
    end

    #POST /posts
    #POST /posts.json
    #POST /posts.xml

    def create
        @post = Post.new(params[:post])

        respond_to do |format|
            if @post.save
                format.html { redirect_to @post, notice: 'Post was successfully created!' }
                format.json { render json: @post, status: :created, location: @post }
            else
                format.html { render action: "new" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    #PUT /posts
    #PUT /posts.json

    def update
        @post = Post.find(params[:id])

        respond_to do |format|
            if @post.update_attributes(params[:post])
                format.html { redirect_to @post, notice: "Post was successfully updated, yeah!" }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /post/1
    # DELETE /post/1.json

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        respond_to do |format|
            format.html { redirect_to posts_url }
            format.json { head :no_content }
        end
    end

end
