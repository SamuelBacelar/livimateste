

class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    #@employees = Employee.all
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true)
    # @employees = Employee.search(params[:search])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)

    if @employee.valid?
      SlackNotifier::CLIENT.ping "é a(o) nova(o) funcionária(o)"
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end

  end

  def show
   
  end

  def edit
    
  end

  def update
    @employee.update(employee_params)
    redirect_to employees_path
  end


  def destroy
    @employee.destroy
    SlackNotifier::CLIENT.ping "não é mais funcionária(o)"
    redirect_to employees_path
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :salary, :job_id)
    end
end
