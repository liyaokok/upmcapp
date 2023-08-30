require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  test "save employee to database" do
    employee_role = EmployeeRole.new(name: "department manager");
    employee = Employee.new(name: "Jim D", email: "email@email.com", salary: 500.01, address: "", password:"password", password_confirmation: "password", employee_role: employee_role)

    assert employee.save
  end

  test "employee without email do not save to database" do
    employee_role = EmployeeRole.new(name: "department manager");
    employee = Employee.new(name: "Jim D", email: "", salary: 500.01, address: "", password:"password", password_confirmation: "password", employee_role: employee_role)

    assert_not employee.save
  end
end
