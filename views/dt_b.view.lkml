view: dt_b {
 derived_table: {
  sql: SELECT 1 as id, 11.7 as num_field, 'B1' AS name
      UNION ALL
      SELECT 2 as id, 1.3 as num_field, 'B2' AS name
      UNION ALL
      SELECT 3 as id, 8.4 as num_field, 'B3' AS name
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

measure: b_avg_measure {
  type: average
  sql: ${TABLE}.num_field ;;
}

measure: new_measure {
  type: number
  value_format_name: percent_2
  sql: ${dt_a.a_avg_measure}/ NULLIF(${b_avg_measure},0) ;;
}

dimension: id {
  type: number
  sql: ${TABLE}.id ;;
  primary_key: yes
}

dimension: num_field {
  type: number
  sql: ${TABLE}.num_field ;;
}

dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

set: detail {
  fields: [id, num_field, name]
}
}
