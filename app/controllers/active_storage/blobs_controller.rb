class ActiveStorage::BlobsController < ActiveStorage::BaseController
    before_action :authenticate_token
    include ActiveStorage::SetBlob

    def show
        expire_in = 1.hour
        redirect_to @blob.service_url(:disposition => params[:disposition] )
    end

    def authenticate_token
        # we can find current user with current_profile
        if request.headers["HTTP_REFERER"].blank? 
            return false
        else
            return true
        end
    end
end