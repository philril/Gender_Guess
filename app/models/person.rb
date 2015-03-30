class Person < ActiveRecord::Base
  validates :height, presence: {message: "Please try again"}, numericality: {greater_than: 0}
  validates :weight, presence: {message: "Please try again"}, numericality: {greater_than: 0}
  # validates :gender, presence: true
end
