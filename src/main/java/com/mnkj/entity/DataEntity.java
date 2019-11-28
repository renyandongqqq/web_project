package com.mnkj.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class DataEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    protected Long creator; // 创建者

    protected Date createTime; // 创建日期

    protected Long lastModifier; // 最后修改人

    protected Date lastModifyTime; // 最后修改时间

    protected Boolean isDeleted; // 是否（0：正常；1：删除）

    protected Integer version; // 版本

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getCreator() {
        return creator;
    }

    public void setCreator(Long creator) {
        this.creator = creator;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getLastModifier() {
        return lastModifier;
    }

    public void setLastModifier(Long lastModifier) {
        this.lastModifier = lastModifier;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
    /**
     * 插入之前执行方法，需要手动调用
     */
    public void preInsert() {
        this.createTime = new Date();
        this.lastModifyTime = this.createTime;
        this.isDeleted = false;
        this.version = 1;
    }

    /**
     * 更新之前执行方法，需要手动调用
     */
    public void preUpdate() {
        this.lastModifyTime = new Date();
    }
}
