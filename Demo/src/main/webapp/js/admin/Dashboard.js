document.addEventListener('DOMContentLoaded', () => {
	const profileLink = document.getElementById('my-profile');
	const logoutLink = document.getElementById('log-out');
	const dashboardLink = document.getElementById('dashboard-link');
	const profileDetailsSection = document.getElementById('profile-details');
	const cardsSection = document.getElementById('dashboard-section');
	const addAdmin = document.getElementById('add-admin');
	const addAdminForm = document.getElementById('add-admin-form');
	const showAdmin = document.getElementById('show-admin');
	const showAdminData = document.getElementById('show-admin-data');
	const addHospital = document.getElementById('add-hospital');
	const addHospitalForm = document.getElementById('add-hospital-form');
	const showHospital = document.getElementById('show-hospital');
	const showHospitalData = document.getElementById('show-hospital-data');
	const addPatient = document.getElementById('add-patient');
	const addPatientForm = document.getElementById('add-patient-form');
	const showPatient = document.getElementById('show-patient');
	const showPatientData = document.getElementById('show-patient-data');
	const addDoctor = document.getElementById('add-doctor');
	const addDoctorForm = document.getElementById('add-doctor-form');
	const showDoctor = document.getElementById('show-doctor');
	const showDoctorData = document.getElementById('show-doctor-data');
	const addSpecialization = document.getElementById('add-specialization');
	const addSpecializationForm = document.getElementById('add-specialization-form');
	const showSpecialization = document.getElementById('show-specialization');
	const showSpecializationData = document.getElementById('show-specialization-data');
	const addAppointment = document.getElementById('add-appointment');
	const addAppointmentForm = document.getElementById('add-appointment-form');
	const showAppointment = document.getElementById('show-appointment');
	const showAppointmentData = document.getElementById('show-appointment-data');
	const showShift = document.getElementById('show-shift');
    const showShiftData = document.getElementById('show-shift-data');
	const showSlot = document.getElementById('show-slot');
	const showSlotData = document.getElementById('show-slot-data');

	profileLink.addEventListener('click', (e) => {
		e.preventDefault();
		profileDetailsSection.style.display = 'block';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';

	});
	logoutLink.addEventListener('click', (e) => {
		e.preventDefault();
		window.location.href = '../../jsp/admin/Login.jsp'; // Redirect to login page
	});
	
	dashboardLink.addEventListener('click', (e) => {
		e.preventDefault();
		cardsSection.style.display = 'flex';// or 'block', depending on your layout
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';

	});
	
	addAdmin.addEventListener('click', (e) => {
		e.preventDefault();
		addAdminForm.style.display = 'block';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	showAdmin.addEventListener('click', (e) => {
		e.preventDefault();
		showAdminData.style.display = 'block';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	
	addDoctor.addEventListener('click', (e) => {
		e.preventDefault();
		addDoctorForm.style.display = 'block';
		showDoctorData.style.display = 'none';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	showDoctor.addEventListener('click', (e) => {
		e.preventDefault();
		showDoctorData.style.display = 'block';
		addDoctorForm.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	
	addPatient.addEventListener('click', (e) => {
		e.preventDefault();
		addPatientForm.style.display = 'block';
		showPatientData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	showPatient.addEventListener('click', (e) => {
		e.preventDefault();
		showPatientData.style.display = 'block';
		addPatientForm.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	
	addHospital.addEventListener('click', (e) => {
		e.preventDefault();
		addHospitalForm.style.display = 'block';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	showHospital.addEventListener('click', (e) => {
		e.preventDefault();
		showHospitalData.style.display = 'block';
		addHospitalForm.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	
	addSpecialization.addEventListener('click', (e) => {
		e.preventDefault();
		addSpecializationForm.style.display = 'block';
		showSpecializationData.style.display = 'none';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	showSpecialization.addEventListener('click', (e) => {
		e.preventDefault();
		showSpecializationData.style.display = 'block';
		addSpecializationForm.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
	});
	
	
	
	
	
	addAppointment.addEventListener('click', (e) => {
		e.preventDefault();
		addAppointmentForm.style.display = 'block';
		showAppointmentData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		cardsSection.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
	});
	showAppointment.addEventListener('click', (e) => {
		e.preventDefault();
		showAppointmentData.style.display = 'block';
		addAppointmentForm.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		showHospitalData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		showShiftData.style.display = 'none';
		showSlotData.style.display = 'none';
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	showShift.addEventListener('click', (e) => {
		e.preventDefault();
		showShiftData.style.display = 'block';
		showHospitalData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
		showSlotData.style.display = 'none';
	});
	showSlot.addEventListener('click', (e) => {
		e.preventDefault();
		showSlotData.style.display = 'block';
		showShiftData.style.display = 'none';
		showHospitalData.style.display = 'none';
		addHospitalForm.style.display = 'none';
		profileDetailsSection.style.display = 'none';
		cardsSection.style.display = 'none';
		addAdminForm.style.display = 'none';
		showAdminData.style.display = 'none';
		addDoctorForm.style.display = 'none';
		showDoctorData.style.display = 'none';
		addPatientForm.style.display = 'none';
		showPatientData.style.display = 'none';
		addSpecializationForm.style.display = 'none';
		showSpecializationData.style.display = 'none';
		addAppointmentForm.style.display = 'none';
		showAppointmentData.style.display = 'none';
		
	});
	
});