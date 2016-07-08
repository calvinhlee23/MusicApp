class Track < ActiveRecord::Base
  TRACK_QUALITY = %w(bonus, regular)
  validates :title, :album_id, presence: true
  validates :bor, presence: true, inclusion: {in: TRACK_QUALITY}

  belongs_to(
    :album,
    class_name: 'Album',
    foreign_key: :album_id
  )
end
