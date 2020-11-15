class Song < ApplicationRecord
	belongs_to :profile
  has_one_attached :mp3_audio
  has_many :likes

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
   title_changed?
  end

  def country_name
    country = self.country
    ISO3166::Country[country]
  end

  def mp3_audio_path
    self.mp3_audio.service_url
  end

  #validates :mp3_audio, attached: true, content_type: ['mp3', 'm4a'],
                                       #size: { less_than: 10.megabytes , message: 'Mp3 file size should be less than 10MB' }

  #validates :title, :country, :presence => true

end
