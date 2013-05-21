class Country < ActiveRecord::Base
  belongs_to :region
  has_attached_file :image, styles: { small: '200x200' }
  # , path: 'public/system/:class/:style/:filename', url: 'public/system/:class/:style/:filename'

  validates :name, presence: true
  validates :image, presence: true
end
