class Order < ActiveRecord::Base
  validates :name,
            presence: true,
            message: "Es muss ein Vorname eingegeben sein."
  validates :surname,
            presence: true,
            message: "Es muss ein Nachname eingegeben sein."
  validates :amount,
            presence: true,
            numericality: { greater_than: 0 },
            message: "Die Menge muss mind. 1 sein."
  belongs_to :event
end