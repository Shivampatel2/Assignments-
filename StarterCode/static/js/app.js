// from data.js
var tableData = data;

var tbody = d3.select("tbody")

function buildTable(data) {
	 tbody.html("")

	data.forEach(function(dataRow){
		var row = tbody.append("tr");

		Object.values(dataRow).forEach((val) => {
			var cell = row.append("td");
			cell.text(val);
		});
	});
}

function Click() {
	 d3.event.preventDefault();

	var date = d3.select("#datetime").property("value"); 
	console.log(date)
	let filteredData = tableData; 

	if (date) {
		filteredData = filteredData.filter(row => row.datetime === date);

	}

	buildTable(filteredData); 
}

//d3.select(window).on("load", buildTable(tableData));


d3.select("#filter-btn").on("click", Click); 

buildTable(tableData); 

// YOUR CODE HERE!
