class RecurrentEntry < ApplicationRecord
  belongs_to :category
  belongs_to :account
  belongs_to :user
  has_many :entries, dependent: :nullify

  validates :value, presence: true

  def has_entry_within_month?
    first_day_of_month = Date.parse(Time.now.strftime('%Y/%m/01'))+1.month
    last_day_of_month = first_day_of_month + 1.month - 1.day
    entry = Entry.where("recurrent_entry_id = :recurrent_entry_id and effective_date >= :effective_date_low and effective_date <= :effective_date_high", {recurrent_entry_id: self.id, effective_date_low: first_day_of_month, effective_date_high: last_day_of_month}).first()
    if entry
      return true
    else
      return false
    end
  end

  # def too_early_within_month?
  #   Date.today < new_entry_date ? true : false
  # end

  def create_entry
    entry = Entry.new
    entry.recurrent_entry_id = self.id
    entry.account_id = self.account_id
    entry.category_id = self.category_id
    entry.effective_date = new_entry_date
    entry.checked = self.checked
    entry.comment = self.comment
    entry.value = self.value

    if entry.save
      true
    else
      false
    end
  end

  private
  def new_entry_date
     self.start_date + ((Date.today+1.month).month-(self.start_date).month).month + ((Date.today+1.month).year-(self.start_date).year).year
  end
end
