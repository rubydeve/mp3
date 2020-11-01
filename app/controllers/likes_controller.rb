class LikesController < ApplicationController
  def index
    @profile = Profile.find(params[:profile_id])
    @likes = @profile.likes
  end

  def destroy
    @song = Song.friendly.find(params[:id])
    like = Like.find_by(:profile_id => current_profile.id, :song_id => @song.id)

    redirect_to songs_path if like.nil?

    like.destroy

    redirect_to songs_path
  end

  def create

  

    @song = Song.friendly.find(params[:id])
    #@song = Song.find(params[:song_id])
    @like = Like.new(:song_id => params[:song_id], :profile_id => current_profile.id)

    if @like.save

      if @song.profile_id != current_profile.id
        #LikesMailer.new_like_message(@playlist.user).deliver
      end
      redirect_to songs_path
    else
      @like.errors.full_messages do |msg|
        flash[:danger] = msg
      end
      render 'index'
    end
  end






end