class List < ActiveRecord::Base
  has_many :items
  belongs_to :user, dependent: :destroy
end
