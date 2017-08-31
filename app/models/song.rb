class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :chart, optional: true
end
