class Patient < ActiveRecord::Base
    belongs_to :clinic

    has_many :appointments
    has_many :vets, through: :appointments

    # Activity 2 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return all patient names
    def self.all_patient_names
        self.all.pluck(:name)
    end

    # Return all patient species
    def self.all_patient_species
        self.all.pluck(:species)
    end

    # Return all patient ages
    def self.all_patient_ages
        self.all.pluck(:age)
    end

    def self.get_attrs
        self.all.pluck(:name, :species, :age)
    end

    def self.oldest_patient
        
        # self.all.min { |p1, p2| p1.age <=> p2.age }
        self.all.max_by{ |p| p.age }
    end

    def self.youngest_patient
        
        # self.all.max { |p1, p2| p1.age <=> p2.age }
        self.all.min_by{ |p| p.age }
    end

    # Return oldest patient (age)
    def self.highest_age
        self.all.maximum(:age)
    end

    # Return youngest patient (age)
    def self.lowest_age
        self.all.minimum(:age)
    end

    # Instance Methods

    # Return patient's first Vet's name
    def get_first_vet_name

        # self.vets.pluck(:vet_name).first
        self.vets.first.vet_name
    end
    
    # Return patient's vet's names
    def get_vet_names
        self.vets.pluck(:vet_name)
    end

    # Return patient's appointment dates
    def get_appt_dates
        self.appointments.pluck(:date)
    end

    # Return patient's number of vets
    def vet_count
        self.vets.length
        # self.vets.count
    end

    # Return patient's number of appointments
    def appt_count
       self.appointments.length
       # self.appointments.count
    end
end 
