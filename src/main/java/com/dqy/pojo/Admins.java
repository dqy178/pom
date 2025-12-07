package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admins {
    private Integer adminId;
    private String userName;
    private String password;
    private String name;
    private String avatar;
    private String phone;
    private String email;
}
