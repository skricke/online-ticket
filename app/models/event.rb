class Event < ActiveRecord::Base
  validates :title,
            presence:  {
                message: "Die Veranstaltung muss einen Namen haben."}
  validates :description,
            length: { maximum: 3000,
                      too_long: "Die Beschreibung darf maximal 3000 Zeichen haben."}
  validates :price,
            presence: {
                message: "Die Veranstaltung muss einen Preis haben."},
            numericality: { greater_than: 0,
                            message: "Es muss ein Preis größer 0 festgelegt sein."}
  validates :venue_id,
            presence: {
                message: "Die Veranstaltung muss einen Veranstaltungsort haben."}

  belongs_to :venue
  accepts_nested_attributes_for :venue, :reject_if => :all_blank
  has_many :orders
  #validates_associated :venue
end
