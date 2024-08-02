/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */



$(document).ready(function () {
    $("#loginForm").submit(function (event) {
        event.preventDefault();
        console.log("Submit button clicked");
        $.ajax({
            type: "GET",
            dataType: "json",
            url: "resources/testlogin",
            success: function (data) {
                console.log("Submit button clicked");
                if (data.success) {
                    console.log("Submit  clicked");
                    window.open('home.html', 'blank');
                } else {
                    alert('Invalid username or password. Please try again.');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error in processing: ' + textStatus);
            }
        });
    });
});