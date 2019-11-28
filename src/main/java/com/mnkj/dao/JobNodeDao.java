package com.mnkj.dao;

import com.mnkj.entity.JobNode;

import java.util.List;

public interface JobNodeDao {

    void addJobNodes(JobNode jobNode);

    JobNode selectJobNodeById(Long id);

    void updateNode(JobNode jobNodeDb);

    List<JobNode> selectNodeById(Long id);

    void delNodes(Long id);
}
