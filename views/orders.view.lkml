view: orders {
  sql_table_name: `orders.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  measure: max_date {
    type: date
    sql: MAX(${created_date}) ;;
    html: <p style="text-align:left; color:#444444">{{ rendered_value | date: "%b %d, %y" }}</p> ;;
    convert_tz: no
  }

  dimension: created_at_date {
    type: date
    #datatype: date
    sql: ${TABLE}.created_at ;;
    html:   {{rendered_value | date:"%m/%d/%Y"}};;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.id, users.first_name, order_items.count]
  }
}
