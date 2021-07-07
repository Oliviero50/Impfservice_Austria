 
let one = new Vue({
	el:"#vue-app-one",
	data: {
			
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

