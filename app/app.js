 
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
						result = response.data;
						console.log(response.data);
					}
				}).catch(e => console.log(e));
		},
		refreshData: function() {
			this._getRequest('/getPersons', this.persons);
			this._getRequest('/getTeilimmunisierteCount', this.teilimmunisierte);
			this._getRequest('/getVollimmunisierteCount', this.vollimmunisierte);
			this._getRequest('/getVaccineShotsCount', this.num_vaccine_shots);
			this._getRequest('/getDeliveredDosesCount', this.delivered_doses)
			this._getRequest('/getVaccinationCentresList', this.vaccination_centres);
			this._getRequest('/getDoctorsList', this.doctors);		
			this._getRequest('/getManufacturerShotsList', this.shots_manufacturer);
			this._getRequest('/getShotsSexList', this.shots_sex);
			this._getRequest('/getVaccinePackagesList', this.vac_packages)
		},
		insertNewShot: function() {
			if(this.insertForm.patient_id != '' && this.insertForm.doctor_id != '' &&
			this.insertForm.vaccination_centre_id != '' && this.insertForm.vaccine_package_id != '') {
				this.insertForm.datetime = new Date();
				console.log(JSON.stringify(this.insertForm))
				axios.post(this.api + '/addVaccineShot', JSON.stringify(this.insertForm)
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

