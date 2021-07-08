 
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

	},
	watch: {

	},

	methods: {
		renderList: (type) => {
			let request = undefined;
			switch(type) {
				case 1:
					request = '';
				break;
				case 2:
					request = '';
				break;
				case 3:
					request = '';
				break;
				case 4:
					request = '';
				break;
			}
			//Request
			axios.get('')
				.then((response)=>{
					if(response.data.error) console.log(response.data.message);
					else {
						this.main_list = response.data.rows;
					}
				});
		}
	}

});

