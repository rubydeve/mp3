class ProfilesController < ApplicationController
  before_action :authenticate_profile!, :except => [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update]
  include ActiveStorage::FileServer

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def live_avatar
    if authenticate_token
      if params.blank?
        @profile = current_profile
      else
        @profile = Profile.friendly.find(params[:user_id])
      end
      serve_file @profile.avatar_path,content_type: params[:content_type], disposition: "inline"
    else
      head :not_found
    end
  end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
       @profile = Profile.friendly.find(params[:id])
        #@profile = Profile.friendly.find_by(displayname: params[:displayname])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :first_name, :last_name, :about, :phone_number, :slug, :displayname )
    end
    def authenticate_token
      if request.headers["HTTP_REFERER"].blank? 
        return false
      else
        return true
      end
    end
end
