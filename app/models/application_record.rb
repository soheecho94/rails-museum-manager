class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.alphabetical
    order('name ASC')
  end
end
