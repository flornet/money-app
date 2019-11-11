class Entry < ApplicationRecord
  after_initialize :set_default_date, unless: :persisted?

  belongs_to :account
  belongs_to :category
  #belongs_to :recurrent_entry
  default_scope { order(effective_date: :desc, created_at: :desc) }

  validates :value, presence: true
  validates :effective_date, presence: true

  def set_default_date
    self.effective_date  ||= Date.today
  end

end
