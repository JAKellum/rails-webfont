class Category < ActiveRecord::Base
  has_many :pairs

  def self.casual
    Category.where(name: 'casual').to_a
  end

  def self.formal
    Category.where(name: 'formal').to_a
  end
end
