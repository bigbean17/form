class Drone < ApplicationRecord
    validates :SN, presence: true, exclusion: {in: %w(! ? < > %), message:"invalid special character" }
    validates :brand, presence: true, exclusion: {in: %w(! ? < > %) }
    validates :model, presence: true, exclusion: {in: %w(! ? < > %) }
    validates :creator, presence: true
end
