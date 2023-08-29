# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# employee_roles
EmployeeRole.destroy_all

EmployeeRole.create!([
    {
        name: "general"
    },
    {
        name: "department manager"
    },
    {
        name: "company manager"
    }
])

# departments
Department.destroy_all

departments = [Department.create!(name: "emergency"), Department.create!(name: "internal medicine"), Department.create!(name: "surgery")]

# tasks
Task.destroy_all

for department in departments do
    for i in 1..3 do
        Task.create!(name: department.name + " task " + i.to_s, department: department);
    end
end

# employees

Employee.destroy_all

Employee.create!([
    {
        name: "Jim D",
        email: "Jim_fake@gmail.com",
        salary: 300000.00,
        address: "100 Jim Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "department manager")
    },
    {
        name: "Bill D",
        email: "Bill_fake@gmail.com",
        salary: 350000.00,
        address: "200 Bill Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "department manager")
    },
    {
        name: "Mike D",
        email: "Mike_fake@gmail.com",
        salary: 360000.00,
        address: "300 Mike Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "department manager")
    },
    {
        name: "Bob C",
        email: "Bob_fake@gmail.com",
        salary: 500000.00,
        address: "1 Bob Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "company manager")
    },
    {
        name: "Emily G",
        email: "Emily_fake@gmail.com",
        salary: 100000.00,
        address: "400 Emily Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "general")
    },
    {
        name: "Robert G",
        email: "Robert_fake@gmail.com",
        salary: 110000.00,
        address: "500 Robert Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "general")
    },
    {
        name: "Emma G",
        email: "Emma_fake@gmail.com",
        salary: 110000.00,
        address: "600 Emma Rd, Pittsburgh PA, 15213",
        password: "password",
        password_confirmation: "password",
        employee_role: EmployeeRole.find_by(name: "general")
    }    
])

# Assign department

# emergency department: 
# Jim D, Emily G, Robert G, Emma G
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Jim D").id, department_id: Department.find_by(name: "emergency").id);
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Emily G").id, department_id: Department.find_by(name: "emergency").id);
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Robert G").id, department_id: Department.find_by(name: "emergency").id);
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Emma G").id, department_id: Department.find_by(name: "emergency").id);
# internal medicine department:
# Bill D, Robert G
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Bill D").id, department_id: Department.find_by(name: "internal medicine").id);
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Robert G").id, department_id: Department.find_by(name: "internal medicine").id);

# surgery department:
# Mike D, Emma G
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Mike D").id, department_id: Department.find_by(name: "surgery").id);
EmployeeDepartmentMap.create!(employee_id: Employee.find_by(name: "Emma G").id, department_id: Department.find_by(name: "surgery").id);

# Assign task
# random
Employee.all.each do |employee|
    employee.departments.each do |department|
        if department.tasks.length > 0
            EmployeeTaskMap.create!(employee_id: employee.id, task_id: department.tasks[rand(department.tasks.length)].id)
        end
    end
end