class PostsController < ApplicationController
    def index
        @posts = Post.all        #refers to all of the post
    end

    def new
        @post = Post.new            # refers to one specific post
    end

    def show
        @post = Post.find(params[:id])              #Post has nothing to do with verb Post like yesterday; could have been named anything else
    end                                       # one specific post


    def create
        @post = Post.new(post_params)       # passing in post_params method
                                            # if the post is created inthe database with the save call we redirect back to /posts
        if @post.save                           
            redirect_to posts_path
        else   
            render :new
        end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to posts_path
        else
            reder :edit
        end
    end

    private                                 # any methods listed under private will be considered 'private' to be used only by this controller

    def post_params
    params.require(:post).permit(:title, :author, :body)        
    end

end
# Post.all returns all posts in the database
