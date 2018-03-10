class Genre < ApplicationRecord
  before_create :clean_name
  before_destroy do
    self.albums.clear
  end

  private
  def clean_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

  has_many :album_genres
  has_many :albums, through: :album_genres
end
