class User < ApplicationRecord
  has_many :receipts, dependent: :destroy
end
