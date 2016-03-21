class Event < ActiveRecord::Base
  validates :title,
            presence: true#,
            #message: "Die Veranstaltung muss einen Namen haben."
  validates :description,
            length: { maximum: 3000,
                      too_long: "Die Beschreibung darf maximal 3000 Zeichen haben."}
  validates :price,
            presence: true,
            numericality: { greater_than: 0}#,
            #message: "Es muss ein Preis größer 0 festgelegt sein."
  belongs_to :venue
  has_many :orders
end