class Project < ApplicationRecord
    validates :name, :description,:status, presence: true

    enum status: ["Propuesta", "Progreso", "Terminado"]
end
