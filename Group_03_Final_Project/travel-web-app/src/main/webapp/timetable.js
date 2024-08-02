$(document).ready(function () {
    $("#getTimetable").click(function (event) {
        event.preventDefault();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "resources/timetable",
            success: function (data) {
                if (data.length > 0) {
                   
                    displayTimetableTable(data);
                } else {
                    alert('No timetable entries found for the current day.');
                }
            },
            error: function (jqXHR, textstatus, errorThrown) {
                alert('Error in processing! ' + textstatus);
            }
        });
    });

    // Function to display timetable in the table
    function displayTimetableTable(timetable) {
        var tableBody = $('#timetableTableBody');
        tableBody.empty(); 
        $.each(timetable, function (index, entry) {
            var row = '<tr>' +
                    '<td>' + entry.subject + '</td>' +
                    '<td>' + entry.startTime + '</td>' +
                    '<td>' + entry.endTime + '</td>' +
                    '<td>' + entry.dayOfWeek + '</td>' +
                    '</tr>';
            tableBody.append(row);
        });
        // Show the timetable table
        $("#timetableTable").show();
    }
});