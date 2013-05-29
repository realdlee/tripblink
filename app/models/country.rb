class Country < ActiveRecord::Base
  belongs_to :region
  has_attached_file :image, styles: { small: '270x270' }

  validates :name, presence: true, uniqueness: true
  validates :region_id, presence: true
end
