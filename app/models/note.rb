class Note < ActiveRecord::Base
  validates :content, :track_id, :user_id, presence: true

  belongs_to(
    :track,
    class_name: "Track",
    foreign_key: :track_id
  )

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id
  )
end
