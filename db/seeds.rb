require 'faker'

5.times do
    Doctor.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      specialty: Faker::Medical::Specialties.type,
      zip_code: Faker::Address.zip_code
    )
  end

  10.times do
    Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end

doctors = Doctor.all
patients = Patient.all

20.times do
    doctor = doctors.sample
    patient = patients.sample
    Appointment.create(
      date: Faker::Time.between(from: DateTime.now, to: 1.year.from_now),
      doctor: doctor,
      patient: patient
    )
end