package com.yupi.starseaoj.common;

import com.yupi.starseaoj.constant.CommonConstant;
import lombok.Data;

/**
 * 分页请求
 * <p>
 * 该类用于封装分页查询的请求参数，通常用于 API 的分页接口中。
 * 前端可以通过该对象来传递分页相关的信息，如当前页号、每页大小、排序字段和排序顺序。
 */
@Data
public class PageRequest {

    /**
     * 当前页号
     * <p>
     * 默认值为 1，表示第一页。前端可以指定具体的页号进行查询。
     */
    private int current = 1;

    /**
     * 页面大小
     * <p>
     * 默认值为 10，表示每页包含 10 条记录。前端可以根据需求指定每页的记录数。
     */
    private int pageSize = 10;

    /**
     * 排序字段
     * <p>
     * 该字段用于指定按照哪个字段进行排序。前端可以传递具体的字段名称。
     */
    private String sortField;

    /**
     * 排序顺序（默认升序）
     * <p>
     * 该字段用于指定排序的顺序，常见的值为 "ASC"（升序）或 "DESC"（降序）。
     * 如果前端没有指定排序顺序，默认按照升序排序。
     */
    private String sortOrder = CommonConstant.SORT_ORDER_ASC;
}
