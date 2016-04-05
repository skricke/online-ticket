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
  validate :amount_cannot_be_more_than_available_tickets
  validates :event_id,
            presence: {
                message: "Die Bestellung muss zu einer Veranstaltung gehören."}

  belongs_to :event
  accepts_nested_attributes_for :event, :reject_if => :all_blank

  def amount_cannot_be_more_than_available_tickets
    tickets = 0
    self.event.orders.each do |t|
      if t.amount != nil
        tickets += t.amount
      end
    end
    seats = self.event.venue.available_seats
    available_tickets = seats - tickets
    if available_tickets < 0
      errors.add :amount, "Zu viele Tickets ausgewählt."
    end
  end
end
