module SongsHelper
  def is_owner(profile_id)
    current_profile.id == profile_id
  end

  def profile_liked?(song_id, profile_id)
    Like.find_by(:song_id => song_id, :profile_id => profile_id) != nil
  end

  def like_id(song_id)
    Like.find_by(:song_id => song_id, :profile_id => current_profile.id)
  end

  def not_owner(song)
    song.profile_id.to_i != current_profile.id.to_i
  end
end
