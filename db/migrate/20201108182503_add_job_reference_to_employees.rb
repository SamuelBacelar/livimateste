class AddJobReferenceToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :job
  end
end
