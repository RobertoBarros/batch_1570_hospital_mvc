require_relative '../views/appointments_view'

class AppointmentsController
  def initialize(appointment_repository, patient_repository, doctor_repository)
    @patient_repository = patient_repository
    @appointment_repository = appointment_repository
    @doctor_repository = doctor_repository
    @view = AppointmentsView.new
    @patients_view = PatientsView.new
    @doctors_view = DoctorsView.new
  end

  def create
    # 1. Escolher um paciente
    patients = @patient_repository.all
    @patients_view.list(patients)
    index = @patients_view.ask_index
    patient = patients[index]

    # 2. Escolher um doctor
    doctors = @doctor_repository.all
    @doctors_view.list(doctors)
    index = @doctors_view.ask_index
    doctor = patients[index]

    # 3. Perguntar a data da consulta
    date = @view.ask_date

    # 4. Instanciar o Appointment
    appointment = Appointment.new(doctor: doctor, patient: patient, date: date)

    # 5. Adiciona no appointment_repository
    @appointment_repository.add(appointment)
  end

  def list
    appointments = @appointment_repository.all
    @view.list(appointments)
  end

end
