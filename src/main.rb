require_relative './person'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'
require_relative './decorators/capitalize_decorator'
require_relative './decorators/trimmer_decorator'

puts "Testing the student-classroom association: \n\n"

classroom = Classroom.new('Math')
student1 = Student.new(age: 22, name: 'maximilianus', classroom: classroom)
student2 = Student.new(age: 26, name: 'gary', classroom: classroom)

classroom.students.each_with_index do |student, index|
  puts "Student #{index}: #{student.name} is subscribed on the #{student.classroom.label} class."
end

puts "\nTesting the person-rental and book-rental associations: \n\n"

book1 = Book.new('awesome book', 'Mr. Awesome')
book2 = Book.new('other title', 'other author')
Rental.new(student1, book1)
Rental.new(student2, book1)
Rental.new(student2, book2)

puts 'Rentals of book1:'
book1.rentals.each do |rental|
  puts "rented by #{rental.person.name} at #{rental.date}"
end
puts "\nRentals of book2:"
book2.rentals.each do |rental|
  puts "rented by #{rental.person.name} at #{rental.date}"
end

puts "\nRentals of student1:"
student1.rentals.each do |rental|
  puts "rented the book '#{rental.book.title}' at #{rental.date}."
end
puts "\nRentals of student2:"
student2.rentals.each do |rental|
  puts "rented the book '#{rental.book.title}' at #{rental.date}."
end
