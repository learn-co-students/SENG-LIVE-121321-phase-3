class Appointment < ActiveRecord::Base
    belongs_to :patient
    belongs_to :vet

    # Activity 1 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return earliest appointment
    def self.earliest
        # self.all.minimum(:date)
        self.all.pluck(:date).min
    end

    # Return latest appointment
    def self.latest
        self.all.pluck(:date).max
    end
    
    # Instance Methods
    
    # Return appointment patient's name
    def get_patient_name
        # self.patient[:name]
        self.patient.name
    end

    # Return appointment vet's name
    def get_vet_name
        # self.vet[:vet_name]
        self.vet.vet_name
    end
end 

