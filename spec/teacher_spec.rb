require '../teacher'
describe Teacher do
  context 'When testing the Teacher class' do
    name = 'Dorcas'
    age = '32'
    specialization = 'Health scientist'
    id = '65'
    teacher = Teacher.new(age, name, specialization, id)
    it 'should confirm the name of the teacher' do
      expect(teacher.name).to eq name
    end
    it 'should confirm the age of the teacher' do
      expect(teacher.age).to eq age
    end
    it 'should return parent permission for teacher' do
      expect(teacher.specialization).to eq specialization
    end
    it 'should confirm the id of the teacher' do
      expect(teacher.id).to eq id
    end
    it 'should return if a teacher can use services = true' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
