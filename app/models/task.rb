class Task < ActiveRecord::Base
	belongs_to :challenge
	validates :name, :type, :point, :presence => true
	validates :point, numericality: {only_integer: true, less_than: 50}
	validates :type, inclusion: {in: %w(DailyTask WeeklyTask MonthlyTask)}

	class << self
	    def type_collection
	      [['Daily', 'DailyTask'],
	       ['Weekly', 'WeeklyTask'],
	       ['Monthly', 'MonthlyTask']
	      ]
	    end
  	end
end
