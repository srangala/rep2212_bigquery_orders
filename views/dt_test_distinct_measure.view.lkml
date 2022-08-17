view: dt_test_distinct_measure {
derived_table: {
  sql: SELECT 1 AS pk_field, 3 AS non_unique_key, 12 AS counter, 'name1' AS name
      UNION ALL
      SELECT 2 AS pk_field, 3 AS non_unique_key, 30 AS counter, 'name2' AS name
      UNION ALL
      SELECT 3 AS pk_field, 2 AS non_unique_key, 10 AS counter, 'name3' AS name
      UNION ALL
      SELECT 4 AS pk_field, 2 AS non_unique_key, 7 AS counter, 'name4' AS name
      UNION ALL
      SELECT 5 AS pk_field, 3 AS non_unique_key, 3 AS counter, 'name5' AS name
       ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
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

dimension: counter {
  type: number
  sql: ${TABLE}.counter ;;
}

dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

set: detail {
  fields: [pk_field, non_unique_key, counter, name]
}
}
