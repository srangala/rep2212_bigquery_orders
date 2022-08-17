view: dt_a {
  derived_table: {
    sql: SELECT 1 as id, 10.5 as num_field, 'A1' AS name
      UNION ALL
      SELECT 2 as id, 4.7 as num_field, 'A2' AS name
      UNION ALL
      SELECT 3 as id, 2.1 as num_field, 'A3' AS name
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: a_avg_measure {
    type: average
    sql: ${TABLE}.num_field ;;
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
