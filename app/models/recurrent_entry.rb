class RecurrentEntry < ApplicationRecord
  belongs_to :category
  belongs_to :account
  belongs_to :user
  has_many :entries, dependent: :nullify

  validates :value, presence: true

  # before_validation :reformat_value
  # def self.find_all_monthly
  #   self.find(:all, :conditions => ["frequency = ? and active = ? and start_date <= ? and end_date >= ?",'Monthly', true, Date.today, Date.today])
  # end
  #
  # def has_entry_within_month?
  #   first_day_of_month = Date.parse(Time.now.strftime('%Y/%m/01'))+1.month
  #   last_day_of_month = first_day_of_month + 1.month - 1.day
  #   entry = Entry.find(:first,
  #   :conditions => ["recurrent_entry_id = ?
  #                    and effective_date >= ?
  #                    and effective_date <= ? ",
  #                    self.id,
  #                    first_day_of_month,
  #                    last_day_of_month])
  #   if entry
  #     return true
  #   else
  #     return false
  #   end
  # end
  #
  # def too_early_within_month?
  #   Date.today < new_entry_date ? true : false
  # end
  #
  # def create_entry
  #   entry = Entry.new
  #   entry.recurrent_entry_id = self.id
  #   entry.account_id = self.account_id
  #   entry.category_id = self.category_id
  #   entry.effective_date = new_entry_date
  #   entry.checked = self.checked
  #   entry.comment = self.comment
  #   entry.value = self.value
  #   if entry.save
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def reformat_value
  #   if value_as_string
  #     self.value_as_string.sub!(',','.')
  #     self.value = Float(self.value_as_string)
  #     self.value = -self.value if (!self.value_as_string.starts_with?("+") && !self.value_as_string.starts_with?("-"))
  #   end
  # end
  #
  # private
  # def new_entry_date
  #   #self.start_date + ((Date.today).month-(self.start_date).month).month
  #   #self.start_date + ((Date.today+1.month).month-(self.start_date).month).month
  #    self.start_date + ((Date.today+1.month).month-(self.start_date).month).month + ((Date.today+1.month).year-(self.start_date).year).year
  # end
end
