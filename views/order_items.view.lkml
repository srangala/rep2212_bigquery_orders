view: order_items {
  sql_table_name: `orders.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
#

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: returned_at {
    type: string
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  measure: number_measure {
    type: number
    value_format_name: percent_2
    sql: ${count}/ NULLIF(${orders.count},0) ;;
  }

  measure: test_case_format2 {
    type: sum
    hidden: yes
    value_format_name: "decimal_0"
    sql:CASE WHEN sale_price > 5 THEN sale_price
    ELSE order_id
    END ;;
    drill_fields: [id, order_id,sale_price]
  }

  measure: test_case_format1 {
    type: sum
    label: "Sold"
    value_format_name: "decimal_2"
    sql:CASE WHEN sale_price > 5 THEN sale_price
    ELSE order_id
    END ;;

    html: {% if sale_price._value > 5 %}

    {{ test_case_format1._rendered_value }}

    {% else %}

    {{ test_case_format2._rendered_value }}

    {% endif %}

    ;;
    drill_fields: [id, order_id,sale_price]
  }

  measure: total_sale {
    type:sum
    value_format_name: "decimal_2"
    sql: ${sale_price} ;;
  }
  measure: total_test {
    type:sum
    value_format_name: "decimal_0"
    sql: ${order_id} ;;
  }
}
