package com.klef.jfsd.SDP.service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.klef.jfsd.SDP.model.Marks;

public interface MarksService {

    public List<Marks> viewAllMarks();
    public String addMarksFromFile(MultipartFile file);
    public List<Marks> getAllMarks();
}
