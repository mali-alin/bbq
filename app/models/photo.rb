class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id is not NULL" }

  validate :photo_presence

  private

  def photo_presence
    if photo.blank?
      errors.add(:base, :photo_presence)
    end
  end
end
