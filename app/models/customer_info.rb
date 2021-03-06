class CustomerInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :age

  belongs_to :table

  validates :sex_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :age_id, numericality: { other_than: 1 , message: "can't be blank"}
end
