 
let app = new Vue({
	el:"#vue-app-one",
	//Data Object, declare all component variables here.
	data: {
		api: 'http://localhost:8080',
		vollimmunisierte: 0,
		teilimmunisierte: 0,
		num_vaccine_shots: 0,
		delivered_doses: 0,
		main_list: [],
		persons: [{id:1, name: 'Max Mustermann'}],
		vaccination_centres: [],
		doktors:[],
		shots_manufacturer: [],
		shots_sex:[],
		vac_packages:[],
		insertForm: {
			patient_id: '',
			vaccination_centre_id:'',
			vaccine_package_id:'',
			doctor_id:'',
			datetime: new Date()
		}
	},
	//Called on start when the component is connected to the DOM.
	//Do first time setup here
	mounted: function(){
		this.refreshData();
	},
	methods: {
		renderList: function(type) {
			let request = undefined;
			switch(type) {
				case 1:
					request = '/getShotsList'; break;
				case 2:
					request = '/getAvailableDosesList'; break;
				case 3:
					request = '/getAppointmentsAndDoses'; break;
				case 4:
					request = '/getSideEffectsSexCount'; break;
			}
			//Request
			this._getRequest(request, this.main_list);
		},
		_getRequest: function(url, result) {
		axios.get(this.api +url)
				.then((response)=>{
					if(response.data.error) console.log(response.data.message);
					else {
						app[result] = response.data;
					}
				}).catch(e => console.log(e));
		},
		refreshData: function() {
			this._getRequest('/getPersons', 'persons');
			this._getRequest('/getTeilimmunisierteCount', 'teilimmunisierte');
			this._getRequest('/getVollimmunisierteCount', 'vollimmunisierte');
			this._getRequest('/getVaccineShotsCount', 'num_vaccine_shots');
			this._getRequest('/getDeliveredDosesCount', 'delivered_doses')
			this._getRequest('/getVaccinationCentresList', 'vaccination_centres');
			this._getRequest('/getDoctorsList', 'doktors');		
			this._getRequest('/getManufacturerShotsList', 'shots_manufacturer');
			this._getRequest('/getShotsSexList', 'shots_sex');
			this._getRequest('/getVaccinePackagesList', 'vac_packages')
		},
		insertNewShot: function() {
			if(this.insertForm.patient_id != '' && this.insertForm.doctor_id != '' &&
			this.insertForm.vaccination_centre_id != '' && this.insertForm.vaccine_package_id != '') {
				this.insertForm.datetime = new Date();
				axios.post(this.api + '/addVaccineShot', 
					{
						patientId: this.insertForm.patient_id,
						vaccinationCentre: this.insertForm.vaccination_centre_id,
						packageId: this.insertForm.vaccine_package_id,
						doctorId: this.insertForm.doctor_id
					}
			  ).then(function (response) {
				setTimeout(()=> app.refreshData(), 2000);
			  }).catch(function (error) {
				console.log(error);
				});
			} else {
				alert('Fullen Sie alle Felder aus');
			}
		}
	}

});

