require_relative '../student'
require_relative '../book'
require_relative '../rental'
require_relative '../classroom'
describe 'testing student' do
  context 'When testing the Student class' do
    it 'should create a student properly' do
      student = Student.new('Dorcas', 40, true)
      expect(student.class).to eq Student
    end
    it 'should add a classroom to student' do
      student = Student.new('NAME', 40, true)
      classroom = Classroom.new('Software')
      student.classroom = classroom
      expect(student.classroom.label).to eq 'Software'
    end
    it 'should be equal ¯\\(ツ)/¯' do
      student = Student.new('NAME', 40, true)
      expect(student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
