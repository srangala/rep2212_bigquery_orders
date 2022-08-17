view: dt_test_distinct_measure {
derived_table: {
  sql: SELECT 1 AS pk_field, 3 AS non_unique_key, 12.01 AS cost, 'name1' AS name
      UNION ALL
      SELECT 2 AS pk_field, 3 AS non_unique_key, 12.01 AS cost, 'name2' AS name
      UNION ALL
      SELECT 3 AS pk_field, 2 AS non_unique_key, 10.00 AS cost, 'name3' AS name
      UNION ALL
      SELECT 4 AS pk_field, 2 AS non_unique_key, 10.00 AS cost, 'name4' AS name
      UNION ALL
      SELECT 5 AS pk_field, 3 AS non_unique_key, 3.50 AS cost, 'name5' AS name
      UNION ALL
      SELECT 6 AS pk_field, 3 AS non_unique_key, 3.50 AS cost, 'name6' AS name
      UNION ALL
      SELECT 7 AS pk_field, 3 AS non_unique_key, 3.50 AS cost, 'name7' AS name
 ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

measure: distinct_cost_sum {
  type: sum_distinct
  sql_distinct_key: ${TABLE}.non_unique_key ;;
  sql: ${TABLE}.cost ;;
}

dimension: pk_field {
  type: number
  sql: ${TABLE}.pk_field ;;
  primary_key: yes
}

dimension: non_unique_key {
  type: number
  sql: ${TABLE}.non_unique_key ;;
}

dimension: cost {
  type: number
  sql: ${TABLE}.cost ;;
}

dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

set: detail {
  fields: [pk_field, non_unique_key, cost, name]
}
}
