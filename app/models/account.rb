class Account < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def absoluteBanlance
    return entries.sum(:value)
  end

  def currentBanlance
    return entries_up_to_today.sum(:value)
  end

  def entries_up_to_today(limit = nil)
    query = Entry.where("account_id = :account_id AND effective_date <= :date", {account_id: id, date: Time.now})
    if limit
      return query.first(limit)
    else
      return query
    end
  end

  def entries_after_today
    return Entry.where("account_id = :account_id AND effective_date > :date", {account_id: id, date: Time.now}).reorder(effective_date: :asc, created_at: :asc)
  end

end
