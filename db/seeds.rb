require 'faker'

10.times do
  City.create(name: Faker::Adress.city)
end

5.times do
  Specialty.create(name: Faker::Medical::Specialties.type)
end

20.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample
  )
  spcialties = Specialty.all.sample(rand(1..3))
  doctor.specialties << specialties
end

30.times do
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample
  )
end

50.times do
  doctor = Doctor.all.sample
  patient = Patient.all.sample
  city = doctor.city # possibilité de mettre patient.city également, étant la même ville

  Appointment.create(
    date: Faker::Time.between(from: DateTime.now, to: 1.year.from_now),
    doctor: doctor,
    patient: patient,
    city: city
  )
end