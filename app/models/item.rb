class Item < ActiveRecord::Base
  belongs_to :list, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
