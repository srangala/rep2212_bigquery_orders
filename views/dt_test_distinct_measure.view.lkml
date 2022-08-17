view: dt_test_distinct_measure {
derived_table: {
  sql: SELECT 1 AS order_item_id, 1 AS order_id, 10.00 AS order_shipping
      UNION ALL
      SELECT 2 AS order_item_id, 1 AS order_id, 10.00 AS order_shipping
      UNION ALL
      SELECT 3 AS order_item_id, 2 AS order_id, 20.00 AS order_shipping
      UNION ALL
      SELECT 4 AS order_item_id, 2 AS order_id, 20.00 AS order_shipping
      UNION ALL
      SELECT 5 AS order_item_id, 2 AS order_id, 20.00 AS order_shipping
 ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

# Will calculate the correct shipping amount
  measure: total_shipping {
    type: sum_distinct
    sql_distinct_key: ${order_id} ;;
    sql: ${order_shipping} ;;
  }

dimension: order_item_id {
  type: number
  sql: ${TABLE}.order_item_id ;;
  primary_key: yes
}

dimension: order_id {
  type: number
  sql: ${TABLE}.order_id ;;
}

dimension: order_shipping {
  type: number
  sql: ${TABLE}.order_shipping ;;
}

set: detail {
  fields: [order_item_id, order_id, order_shipping]
}
}
