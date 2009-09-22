class ForOption < ActiveRecord::Base
  has_many :questions

  def latest_questions(number = nil)
    options = {
      :conditions => ["for_option_id = ?", id],
      :order => 'created_on DESC'
    }
    options[:limit] = number if number
    Question::find(:all,  options)
  end
end
