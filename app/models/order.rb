class Order < ActiveRecord::Base
  validates :name,
            presence: {
                message: "Es muss ein Vorname eingegeben sein."}
  validates :surname,
            presence: {
                message: "Es muss ein Nachname eingegeben sein."}
  validates :amount,
            presence: true,
            numericality: { greater_than: 0,
                            message: "Die Menge muss mind. 1 sein."}
  validates :event_id, presence: {
      message: "Die Bestellung muss zu einer Veranstaltung gehören."}
  #accepts_nested_attributes_for :event, :reject_if => :all_blank
  belongs_to :event
end
