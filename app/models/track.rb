class Track < ActiveRecord::Base
  TRACK_QUALITY = %w(bonus regular)
  validates :title, :album_id, presence: true
  validates :bor, presence: true, inclusion: {in: TRACK_QUALITY}
  #lyrics is an option. So, not validating here.
  belongs_to(
    :album,
    class_name: 'Album',
    foreign_key: :album_id
  )

  has_many(
    :notes,
    class_name: "Note",
    foreign_key: :track_id
  )
end
