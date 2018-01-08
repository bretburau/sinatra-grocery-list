class Recipe < ActiveRecord::Base
  has_many :recipes_groceries
  has_many :groceries, through: :recipes_groceries

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.select {|name| name.slug == slug}.last      
  end
end