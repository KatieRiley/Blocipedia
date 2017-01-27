class CollaboratorsController < ApplicationController

  def create
    wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    collaborator = user.collaborators.build(wiki: wiki)

    if collaborator.save
      flash[:notice] = "Collaborator saved"
    else
      flash[:alert] = "Unable to update collaborators."
    end

    redirect_to :back
  end

  def destroy
    wiki = Wiki.find(params[:wiki_id])
    user = User.find(params[:user_id])
    collaborator = user.collaborators.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "Collaborator deleted"
    else
      flash[:alert] = "Unable to update collaborators."
    end

    redirect_to :back
  end
end
