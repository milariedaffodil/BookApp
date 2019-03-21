class Book < ApplicationRecord

	belongs_to :user
	belongs_to :category
	has_many :reviews
	#belongs_to :user_pic
	mount_uploader :user_pic, ProfileUploaderUploader


	def self.search(search)
	  if search
	    #find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    where('title LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end

	# #added for validation if I add this the book will not add ERROR NOT  WORKING
	# validates :title, :author, :description, :presence => true
	# validates :title, :author, :description, :length => { :minimum => 2}
	# validates :title, :author, :uniqueness => true

end
