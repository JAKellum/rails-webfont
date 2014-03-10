class Category < ActiveRecord::Base
  has_many :pairs

  def self.casual
    Category.where(name: 'casual').first
  end

  def self.formal
    Category.where(name: 'formal').first
  end
end
