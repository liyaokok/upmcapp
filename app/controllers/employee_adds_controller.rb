class EmployeeAddsController < ApplicationController
    def new
        @employee = Employee.new
    end
end