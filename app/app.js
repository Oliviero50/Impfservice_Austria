 
let one = new Vue({
	el:"#vue-app-one",
	data: {
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
		vac_packages:[]
	},
	computed: {

	},
	mounted: ()=>{
		this._getRequest('/getPersons', this.persons);
		this._getRequest('/getTeilimmunisierteCount', this.teilimmunisierte);
		this._getRequest('/getVollimmunisierteCount', this.vollimmunisierte);
		this._getRequest('/getVaccineShotsCount', this.num_vaccine_shots);
		this._getRequest('/getDeliveredDosesCount', this.delivered_doses)
		this._getRequest('/getVaccinationCentresList', this.vaccination_centres);
		this._getRequest('/getDoctorsList', this.doctors);		
		this._getRequest('/getManufacturerShotsList', this.shots_manufacturer);
		this._getRequest('/getShotsSexList', this.shots_sex);
		this._getRequest('/getVaccinePackagesList', this.vac_packages);

	},
	watch: {

	},
	methods: {
		renderList: (type) => {
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
		_getRequest: (url, result) => {
			axios.get(this.api +'')
				.then((response)=>{
					if(response.data.error) console.log(response.data.message);
					else {
						result = response.data.rows;
					}
				});
		}
	}

});

