class App < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

has_attached_file :image, styles: { 
		medium: "250x250>",
		thumb: "250x250>"
		}, 
		default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
