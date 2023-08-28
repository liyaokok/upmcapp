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

departments = [Department.create!(name: "emergecy"), Department.create!(name: "internal medicine"), Department.create!(name: "surgery")]

# tasks
Task.destroy_all

for department in departments do
    for i in 1..3 do
        Task.create!(name: department.name + " task " + i.to_s, department: department);
    end
end