package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 杜青云
 * Date  2025/7/9 下午2:20
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Titles {
    private Integer id;
    private String titleName;
    private String description;
}
