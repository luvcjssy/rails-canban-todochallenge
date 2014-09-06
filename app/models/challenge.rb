class Challenge < ActiveRecord::Base
	belongs_to :creator, :foreign_key => :creator_id, :class_name => 'User'
	has_many :tasks
	validates :name, :starts_on, :presence => true
	validates :name, :length => {:minimum => 10, :maximum => 50}
	validates :description, :length => {:maximum => 500}
	validate :starts_on_is_in_future, :on => :create

	before_save :generation_code

	def generation_code
		self.code = SecureRandom.hex()
	end

	protected
	def starts_on_is_in_future
		#Rails.log(starts_on)
		if starts_on && (starts_on < Date.today)
			errors.add(:starts_on, "should be in the future")
		end
	end
end
