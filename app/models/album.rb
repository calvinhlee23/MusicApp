class Album < ActiveRecord::Base
  ALBUM_QUALITY = %w(live studio)
  validates :title, :band_id presence: true
  validates :los, presence: true, inclusion: {in: ALBUM_QUALITY}
  
  belongs_to(
    :band,
    class_name: 'Band',
    foreign_key: :band_id
  )
  has_many(
    :tracks, dependent: :destroy
    class_name: 'Track',
    foreign_key: :albumn_id
  )

end
