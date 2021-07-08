 
let one = new Vue({
	el:"#vue-app-one",
	data: {
		act_columns: ['Vorname', 'Nachname', 'Alter', 'Geschlecht', 'Dosis', 'Impfung'],
		act_rows: [['Max', 'Mustermann', 24, 'M', 2, 'Pfizer']]
	},
	computed: {

	},
	mounted: function(){

	},
	watch: {

	},
	created () {
	},
	methods: {
		
		getNotes: function() {
			axios.get('api/notes.php')
				.then(function(response){
					if(response.data.error){
						console.log(response.data.message);
					}
					else{
						one.get_notes = response.data.notes;
						
					}
				});
		},
		
		}

});

