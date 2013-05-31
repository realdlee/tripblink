class City < ActiveRecord::Base
  belongs_to :country, inverse_of: :cities
  has_attached_file :image, styles: { small: '270x270' }

  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true
  validates :backpacker_index, numericality: true
end
