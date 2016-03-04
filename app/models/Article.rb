class Article < ActiveRecord::Base
  belongs_to :user 	
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }	#validates the presence of title
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }	#validates the presence of description
  validates :user_id, presence: true
 end