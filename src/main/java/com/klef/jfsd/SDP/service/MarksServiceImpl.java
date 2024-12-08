package com.klef.jfsd.SDP.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.SDP.model.Marks;
import com.klef.jfsd.SDP.repository.MarksRepository;

@Service
public class MarksServiceImpl implements MarksService {

    @Autowired
    private MarksRepository marksRepository;

    @Override
    public List<Marks> viewAllMarks() {
        return marksRepository.findAll();
    }

    @Override
    public String addMarksFromFile(MultipartFile file) {
        try {
            // Reading the uploaded file using BufferedReader
            BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream()));
            String line;
            List<Marks> marksList = new ArrayList<>();

            boolean isHeader = true; // To skip the header row

            while ((line = br.readLine()) != null) {
                if (isHeader) {
                    isHeader = false;
                    continue; // Skip the first row (header)
                }

                // Split the line into columns
                String[] data = line.split(","); // Assuming the file uses commas as delimiters
                if (data.length >= 9) {
                    try {
                        // Extracting data
                        String studentName = data[1].trim();
                        String regId = data[2].trim();
                        String courseCode = data[3].trim();
                        String courseName = data[4].trim();
                        String attendance = data[5].trim();
                        String passed = data[6].trim();
                        String failed = data[7].trim();
                        String totalMarks = data[8].trim();

                        // Parsing integer values safely
                        int regIdInt = safeParseInt(regId, -1);
                        int attendanceInt = safeParseInt(attendance, 0);
                        int passedInt = safeParseInt(passed, 0);
                        int failedInt = failed.equalsIgnoreCase("NIL") ? 0 : safeParseInt(failed, 0);
                        int totalMarksInt = safeParseInt(totalMarks, 0);

                        // Creating a Marks object
                        Marks mark = new Marks();
                        mark.setStudentName(studentName);
                        mark.setRegId(regIdInt);
                        mark.setCourseCode(courseCode);
                        mark.setCourseName(courseName);
                        mark.setAttendance(attendanceInt);
                        mark.setPassed(passedInt);
                        mark.setFailed(failedInt);
                        mark.setTotalMarks(totalMarksInt);

                        // Adding the Marks object to the list
                        marksList.add(mark);
                    } catch (Exception e) {
                        System.out.println("Invalid data line: " + line + " - Error: " + e.getMessage());
                    }
                } else {
                    System.out.println("Insufficient columns in line: " + line);
                }
            }

            // Save all valid marks to the database
            marksRepository.saveAll(marksList);

            return "Marks uploaded successfully!";

        } catch (Exception e) {
            e.printStackTrace();
            return "Error while processing the file: " + e.getMessage();
        }
    }

    // Helper method to safely parse integers
    private int safeParseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value.trim());
        } catch (NumberFormatException e) {
            return defaultValue; // Return default value if parsing fails
        }
    }
    

       public List<Marks> getAllMarks() {
            return marksRepository.findAll();
        }
       
       


    
    
}
