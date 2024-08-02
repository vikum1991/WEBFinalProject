/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group3.WebApp.day.task;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Pc
 */
@Path("/")
public class TravelTimeTable {

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
    @Path("/timetable")
    @Produces("application/json")
    public static String getTimetable() {
        try (Connection conn = TravelTimeTable.conn(); 
             PreparedStatement pst = conn.prepareStatement("SELECT * FROM timetable WHERE dayOfWeek = DAYNAME(NOW())"); 
             ResultSet rs = pst.executeQuery()) {

            List<String> timetableList = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("id");
                String subject = rs.getString("subject");
                Time sTime = rs.getTime("sTime");
                Time eTime = rs.getTime("eTime");

                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                String formattedStartTime = timeFormat.format(sTime);
                String formattedEndTime = timeFormat.format(eTime);

                String pattern = "{\"id\": %d, \"subject\": \"%s\", \"startTime\": \"%s\", \"endTime\": \"%s\", \"dayOfWeek\": \"%s\"}";
                timetableList.add(String.format(pattern, id, subject, formattedStartTime, formattedEndTime, rs.getString("dayOfWeek")));
           
            }

            if (!timetableList.isEmpty()) {
                return "[" + String.join(",", timetableList) + "]";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "{\"error\": \"Failed to fetch timetable. Check server logs for details.\"}";
        }

        return "[]"; 
    }
}
