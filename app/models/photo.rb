class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id is not NULL" }
end
