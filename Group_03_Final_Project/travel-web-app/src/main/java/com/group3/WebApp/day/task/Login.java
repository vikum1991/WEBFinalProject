package com.group3.WebApp.day.task;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Response;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.ws.rs.core.MediaType;

@Path("/")
public class Login {

    public Connection conn() throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/testdatabase";
        String user = "admin";
        String password = "admin";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    @GET
    @Path("/testlogin")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getLogin() {
        try (Connection conn = conn(); 
             PreparedStatement pst = conn.prepareStatement("SELECT * FROM testlogin");
             ResultSet rs = pst.executeQuery()) {

            if (rs.next()) {
                String userNameFromDB = rs.getString("user_name");
                String passwordFromDB = rs.getString("user_password");

                String expectedUserName = "admin";
                String expectedPassword = "admin";

                boolean loginSuccessful = userNameFromDB.equals(expectedUserName) && passwordFromDB.equals(expectedPassword);

                String responsePattern = "{\"success\": %s}";
                String jsonResponse = String.format(responsePattern, loginSuccessful);
                return Response.ok(jsonResponse).build();
            } else {
                return Response.ok("{\"success\": false}").build();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            String errorResponse = "{\"error\": \"" + e.getMessage() + "\"}";
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(errorResponse).build();
        }
    }
}
