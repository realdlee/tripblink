class Country < ActiveRecord::Base
  belongs_to :region, inverse_of: :countries
  has_many :comments, as: :commentable
  has_many :cities, inverse_of: :country
  has_attached_file :image, styles: { small: '270x270' }

  validates :name, presence: true, uniqueness: true
  validates :region_id, presence: true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
