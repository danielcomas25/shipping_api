class Carrier < ApplicationRecord
  validates :code, uniqueness: true
end
