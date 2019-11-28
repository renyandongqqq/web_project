package com.mnkj.entity;

public class JobNode extends DataEntity implements java.io.Serializable  {
    private static final long serialVersionUID = 1L;
    private Long id;//节点ID
    private Long jobId;//计划ID
    private String jobNodename;//节点名称
    private String nodeDescribe;//节点描述

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getJobId() {
        return jobId;
    }

    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    public String getJobNodename() {
        return jobNodename;
    }

    public void setJobNodename(String jobNodename) {
        this.jobNodename = jobNodename;
    }

    public String getNodeDescribe() {
        return nodeDescribe;
    }

    public void setNodeDescribe(String nodeDescribe) {
        this.nodeDescribe = nodeDescribe;
    }
}
