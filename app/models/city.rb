class City < ActiveRecord::Base
  belongs_to :country
  has_attached_file :image, styles: { small: '270x270' }

  validates :name, presence: true
  validates :country_id, presence: true
  validates :backpacker_index, numericality: true
end
