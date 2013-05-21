class Region < ActiveRecord::Base
  has_many :countries

  validates :name, presence: true
end
