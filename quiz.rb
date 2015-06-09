require 'rainbow/ext/string'

class Quiz

  QUESTIONS = [
    {"What is the relationship between a superclass and a subclass?": "Subclasses inherit behaviors and attributes from pre-existing superclasses."},
    {"What is the definition of inheritance?": "Through inheritance, an class can aqcuire the properties and methods of another class."},
    {"What is polymorphism?": "Polymorphism allows different objects to be accessed by a common interface."},
    {"What is the Liskov substitution principle?": "When many different types implement the same interface, they can be substituted for one another."},
    {"What is encapsulation?": "Encapsulation provides objects with the ability to hide internal characteristics and behavior. Encapsulation itself is just the practice of putting functions and data inside a container."},
    {"What is abstraction?": "Abstraction allows us to obscure details and give us  the ability to talk about problems at a higher level."},
    {"What is the relationship between encapsulation and data hiding?": "Through encapsulation, data can be hidden; we can protect the internal state of the object by hiding attributes."},
    {"Name the four pillars of OOP (according to some)": "Abstraction, Polymorphism, Inheritance, Encapsulation"},
    {"What are two ways to implement polymorphism?": "1) Inheritance 2) Design by contract (interface contract)"},
    {"What is the difference between abstraction and encapsulation?": "Encapsulation can be used as a strategy to provide abstraction."},
    {"What are 'setters' & 'getters'?": "They are deliberate constraints designed to dictate how the object will maintain its state in the public interface"}
  ]

  attr_reader :question_number

  def initialize
    @question_number = 0
  end

  def next
    @question_number = (rand(QUESTIONS.length))
  end

  def get_question
    QUESTIONS[@question_number].keys
  end

  def get_answer
    QUESTIONS[@question_number].values
  end

  def add_question(question, answer)
    new_q = {question: answer}
    QUESTIONS.push(new_q)
  end

end

puts "OOP Quiz"
puts "*"*72
puts "Ideally you should work on this with a pair or a rubber duck."
puts "Type 'run' to begin the quiz, or 'help' if you get confused."

while true
  input = STDIN.gets.chomp
  if input == 'help'
    puts ("-" * 72).color(:cyan)
    puts ("Type run to run the quiz from the beginning").color(:blue)
    puts ("Type exit to exit").color(:blue)
    puts ("Type add to add a question/answer to your personal list").color(:blue)
    puts ("-" * 72).color(:cyan)

  elsif input == 'run'
    quiz = Quiz.new
    puts ("-" * 72 + "Q" + "--").color(:cyan)
    puts quiz.get_question
    puts ("-" * 75).color(:cyan)
    puts 'Type a to get the answer'.color(:blue)

  elsif input == 'next'
    quiz.next
    puts ("-" * 72 + "Q" + "--").color(:cyan)
    puts quiz.get_question
    puts ("-" * 75).color(:cyan)
    puts 'Type a to get the answer'.color(:blue)

  elsif input == 'a'
    puts ("-" * 72 + "A" + "--").color(:green)
    puts quiz.get_answer
    puts ("-" * 75).color(:green)
    puts 'Type next to get next question'.color(:blue)

  elsif input == 'add'
    puts "Please enter a question: "
    question = STDIN.gets.chomp
    puts "Please enter an answer: "
    answer = STDIN.gets.chomp
    quiz.add_question(question, answer)
    puts "Your question has been saved (at least for as long as the program runs...)"
    puts "To permanently add a question:"
    puts "Just open this file in the text editor of your choice and add it to the QUESTIONS array on line 5."

  elsif input == 'exit'
    exit
  else
    puts ("Your command is not recognized. Please type help.").color(:red)
  end
end
