class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }	#validates the presence of title
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }	#validates the presence of description
 end