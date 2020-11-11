class Employee < ApplicationRecord

    
    belongs_to :job
    validates :name, presence: {message: " é obrigatório" }
    validates :email, presence: {message: " é obrigatório" } , uniqueness: {message: "O email %{value} já está cadastrado"}
    validates :salary, :job_id, presence: true
    # validates :name, uniqueness: true

    def self.search(search)
        if search
            where(["name LIKE ?", "%#{search}%"])
        else
            all
        end
    end
end
