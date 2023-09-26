class Question
  def self.generate
    num1 = rand(1..20)
    num2 = rand(1..20)
    { question: "#{num1} plus #{num2} equal?", answer: num1 + num2}
  end
end