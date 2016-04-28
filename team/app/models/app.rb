class App < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :app_img, :styles => { :app_index => "250x350>", :app_show => "325x475>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :app_img, :content_type => /\Aimage\/.*\Z/
end
