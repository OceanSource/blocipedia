class WikisController < ApplicationController
	
	before_action :find_wiki, except: [:new, :create, :index]

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
   # @wiki = Wiki.find(params[:id])
    @collaborators = @wiki.collaborators
  end

  def new
  	@users = User.all
    @wiki = Wiki.new()
    @wiki.private = true
    authorize @wiki
  end

  def create
  	
     #@wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
     @wiki = current_user.wikis.build( wiki_params )
     @user = @wiki.user
     authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki has been saved."
      redirect_to @user
    else
      flash[:notice] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @user = @wiki.user
    @users = User.all
  end

  def update
    @user = @wiki.user
    #authorize @wiki

    if @wiki.update_attributes( wiki_params )
      flash[:notice] = "Wiki has been updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error updating the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end
  
  private
  
  
  def find_wiki
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, collaborator_ids:[])
  end

end
