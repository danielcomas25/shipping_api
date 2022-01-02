class CountryDistance < ApplicationRecord
  serialize :distance, Hash
  validates :country, uniqueness: true
end
