class Question < ActiveRecord::Base
  validates_presence_of :name, :url, :body, :for_option
  validates_length_of :name, :maximum => 45
  validates_length_of :url, :maximum => 255
  validates_length_of :body, :maximum => 1000
  belongs_to :for_option
end
