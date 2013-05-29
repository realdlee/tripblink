class Region < ActiveRecord::Base
  has_many :countries, inverse_of: :region

  validates :name, presence: true, uniqueness: true
end
