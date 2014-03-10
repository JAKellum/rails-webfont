class Category < ActiveRecord::Base
  has_many :pairs

  def self.casual
    Category.where(name: 'casual').first.id.to_i
  end

  def self.formal
    Category.where(name: 'formal').first.id.to_i
  end
end
