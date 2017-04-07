class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(params_post)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])
  end

  def destroy

   @post = current_user.posts.find(params[:id])
   @post.destroy
   flash[:alert] = "Group deleted"
   redirect_to account_posts_path
 end

 def update
     @group = Group.find(params[:group_id])
     @post = Post.find(params[:id])
     if @post.update(params_post)
       redirect_to account_posts_path, notice: "Update Success!"
     else
       render :edit
     end
  end

  private

  def params_post
    params.require(:post).permit(:content)
  end
end
