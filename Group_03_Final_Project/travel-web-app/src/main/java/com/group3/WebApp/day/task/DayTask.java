/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group3.WebApp.day.task;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import javax.swing.JOptionPane;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.Gson;
import jakarta.ws.rs.core.MediaType;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pc
 */
@Path("/")
public class DayTask {

    public static Connection conn() {
        try {
            String url = "jdbc:mysql://localhost:3306/testdatabase";
            String user = "admin";
            String password = "admin";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            return conn;
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return null;
    }

    @GET
    @Path("/task")
    @Produces("application/json")
    public static String getTasks() {
        try (Connection conn = DayTask.conn(); PreparedStatement pst = conn.prepareStatement("SELECT * FROM task WHERE tskDate = CURDATE()"); ResultSet rs = pst.executeQuery()) {

            List<String> taskList = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("id");
                Date tskDate = rs.getDate("tskDate");
                Time tskTime = rs.getTime("tskTime");
                String tskName = rs.getString("tskName");

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                String formattedDate = dateFormat.format(tskDate);
                String formattedTime = timeFormat.format(tskTime);

                String pattern = "{\"id\": %d, \"tskDate\": \"%s\", \"tskTime\": \"%s\", \"tskName\": \"%s\"}";
                taskList.add(String.format(pattern, id, formattedDate, formattedTime, tskName));
            }

            if (!taskList.isEmpty()) {
                return "[" + String.join(",", taskList) + "]";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "{\"error\": \"Failed to fetch tasks. Check server logs for details.\"}";
        }

        return "[]"; // Return empty JSON array if there are no tasks
    }

    @POST
    @Path("/task")
    @Produces("application/json")
    public String addTask(@FormParam("tskDate") String tskDate,
            @FormParam("tskTime") String tskTime,
            @FormParam("tskName") String tskName) {
        try (Connection conn = DayTask.conn(); 
            PreparedStatement pst = conn.prepareStatement("INSERT INTO task (tskDate, tskTime, tskName) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
           ) {
           
            // Parse date and time strings into java.sql.Date and java.sql.Time
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

            java.util.Date parsedDate = dateFormat.parse(tskDate);
            java.util.Date parsedTime = timeFormat.parse(tskTime);

            Date sqlDate = new Date(parsedDate.getTime());
            Time sqlTime = new Time(parsedTime.getTime());

            pst.setDate(1, sqlDate);
            pst.setTime(2, sqlTime);
            pst.setString(3, tskName);

            int affectedRows = pst.executeUpdate();

            if (affectedRows > 0) {
                // Get the generated task ID
                ResultSet generatedKeys = pst.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int id = generatedKeys.getInt(1);

                    // Return the added task as JSON
                    String pattern = "{\"id\": %d, \"tskDate\": \"%s\", \"tskTime\": \"%s\", \"tskName\": \"%s\"}";
                    return String.format(pattern, id, tskDate, tskTime, tskName);
                }
            }

        } catch (SQLException | java.text.ParseException e) {
            e.printStackTrace();
            return "{\"error\": \"Failed to add task. Check server logs for details.\"}";
        }

        return "{\"error\": \"Failed to add task.\"}";
    }
}
