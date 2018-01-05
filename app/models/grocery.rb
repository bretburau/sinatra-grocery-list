class Grocery < ActiveRecord::Base
  belongs_to :recipe

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.select {|name| name.slug == slug}.last      
  end
end