$(document).ready(function () {
    $("#getTasks").click(function (event) {
        console.log("Submit button clicked");
        event.preventDefault();
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "resources/task",
            success: function (data) {
                if (data.length > 0) {
                    // Assuming data is an array of tasks
                    displayTaskDetails(data[0]); // Display the details of the first task

                    // Display tasks in the table
                    displayTaskTable(data);
                } else {
                    alert('No tasks found for the current date.');
                }
            },
            error: function (jqXHR, textstatus, errorThrown) {
                alert('Error in processing! ' + textstatus);
            }
        });
    });

    // Function to display task details in the details section
    function displayTaskDetails(task) {
        $('#tskDate').val(task.tskDate);
        $('#tskTime').val(task.tskTime);
        $('#tskName').val(task.tskName);
    }

    // Function to display tasks in the table
    function displayTaskTable(tasks) {
        var tableBody = $('#taskTableBody');
        tableBody.empty(); // Clear existing rows
        $.each(tasks, function (index, task) {
            var row = '<tr>' +
                    '<td>' + task.tskDate + '</td>' +
                    '<td>' + task.tskTime + '</td>' +
                    '<td>' + task.tskName + '</td>' +
                    '</tr>';
            tableBody.append(row);
        });
    }

});

$(document).ready(function () {
    // Show the add task form when the "Add Tasks" button is clicked
    $("#addTasks").click(function () {
        console.log("Submit button clicked");

        // Hide other sections and show the add task form
        $("#getTasksForm").hide();
        $("#addTaskForm").show();
    });

    // Handle the click event of the "Submit" button in the add task form
    $("#submitTask").click(function (event) {
        event.preventDefault();

        console.log("Submit button clicked");
        // Get the values from the form
        var tskDate = $("#taskDate").val();
        var tskTime = $("#taskTime").val();
        var tskName = $("#taskName").val();
        // Create a task object
        var newTask = {
            tskDate: tskDate,
            tskTime: tskTime,
            tskName: tskName
        };
        console.log("Data being sent:", JSON.stringify(newTask));

        // Perform an AJAX request to add the new task
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "resources/task",
            success: function (newTask) {
                console.log("Success:", newTask);
                // Optionally, you can handle the success response
                // For example, you might want to update the task list or show a success message
                console.log("Task added successfully");
            },
            error: function (jqXHR, textstatus, errorThrown) {
                console.error("Error:", textStatus, errorThrown, jqXHR.responseText);
                alert('Error in processing! ' + textStatus + '\n' + errorThrown);
            }
        });

        // Optionally, you can hide the add task form after submission
        $("#addTaskForm").hide();

        // You might want to trigger a function to refresh the task list here
        // For example: refreshTaskList();
    });

    // Function to cancel adding a task and hide the add task form
    function cancelAddTask() {
        $("#addTaskForm").hide();
    }
});
