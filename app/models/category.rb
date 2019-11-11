class Category < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  validates :name, presence: true, uniqueness: true
	default_scope { order(name: :asc) }
end
