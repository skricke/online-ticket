class Venue < ActiveRecord::Base
  validates :title,
            presence: true,
            message: "Veranstaltungsort muss einen Titel haben."
  validates :description,
            length: { maximum: 300,
                      too_long: "Die Beschreibung darf maximal 300 Zeichen haben."}
  validates :available_seats,
            presence: true,
            numericality: { greater_than: 0,
                            only_integer: true},
            message: "Verfügbare Plätze muss eine gerade Zahl größer 0 sein."
  has_many :events, dependent: :destroy
  validates_associated :events
end