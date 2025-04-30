package com.forge.dto;

import com.forge.entity.Adopt;

public class AdoptDto extends Adopt {
    /**
     * 宠物姓名
     */
    private String petName;
    /**
     * 用户姓名
     */
    private String clientName;
    /**
     * 年龄
     */
    private String clientAge;
    /**
     * 联系电话
     */
    private String clientTel;

    public String getClientAge() {
        return clientAge;
    }

    public void setClientAge(String clientAge) {
        this.clientAge = clientAge;
    }

    public String getClientTel() {
        return clientTel;
    }

    public void setClientTel(String clientTel) {
        this.clientTel = clientTel;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }
}
